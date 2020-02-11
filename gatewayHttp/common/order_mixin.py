#encoding: utf-8
import copy
import json
import uuid
import time
import urllib
import hashlib
import functools
from datetime import datetime
from tornado.options import options
from tornado.ioloop import IOLoop

import settings
import command
import constant
import platform_defines
from common.notify_url import NotifyUrl
from utils.mysql import construct_select_sql, construct_insert_sql, construct_update_sql, construct_upsert_sql, MysqlExpr


class OrderMixin(object):

    @staticmethod
    def get_repeat_notice_url(app, platformid):
        notice_url = settings.pay_notice_url[options.mode]
        url = notice_url['proto'] + '://' + app['simple_name'] + notice_url['host'] + '/' + str(app['id']) + '/' + platform_defines.id_to_name(int(platformid)) + '/repeat_notice'
        return url

    @staticmethod
    def get_pay_notice_url(app, platformid):
        '''return the pay notice url'''
        notice_url = settings.pay_notice_url[options.mode]
        url = notice_url['proto'] + '://' + app['simple_name'] + notice_url['host'] + '/' + str(app['id']) + '/' + platform_defines.id_to_name(int(platformid)) + '/pay_notice'
        return url

    @staticmethod
    def get_fake_order():
        return "fake_%s"%uuid.uuid1()

    def get_order_table_name(self):
        return "orders"

    def notify_order(self, my_order_id, real_money, theirs_order_id='', serverid='', extdata=''):
        def callback(result, error):
            if error or not result:
                self.log_error("order:%s not exists in creating_orders"%my_order_id)
            else:
                order_info = result[0]
                packet = command.AS2PSRechargeCommand()
                packet.uiTalkingSDKAppId = int(self._app["id"])
                packet.nPlatformID = int(self._platform_info["distributor_id"])
                packet.szPlatformOrder = theirs_order_id
                packet.szGameOrder = my_order_id
                packet.uiPlayerID = int(order_info['role_id'])
                packet.fOriginalMoney = float(order_info['ideal_price'])
                packet.fOrderMoney = real_money or float(order_info['real_price'])
                packet.uiGoodsID = int(order_info['item_id'])
                packet.nServerID = int(serverid) if serverid else int(order_info.get('server_id',0))
                packet.nStatus = 2
                packet.szDataEx = extdata or order_info['ext'] or ""
                def on_saved(result, ex):
                    if not ex:
                        self.gateway.send(packet, app=self._app)
                        self.log_info("game pay:(%s)", packet)
                        IOLoop.instance().call_later(10, functools.partial(self.check_pay_confirmed, packet))
                    else:
                        self.log_error("on_saveed err:(%s,%s,%s)", my_order_id, theirs_order_id, ex)
                self.save_order(packet, on_saved, {'verified': 1})
        self.is_creating_order_exists(my_order_id, callback)

    def is_order_exists(self, app_order_id, callback):
        query_cond = ["my_order_id = {0}",app_order_id]
        table_name = self.get_order_table_name()
        sql = construct_select_sql("select count(*) as order_count from %s" % table_name, query_cond)
        def cb(result,ex):
            if ex:
                self.log_error("is_order_exists:sql:%s", sql, exc_info=ex)
            else:
                callback(result,ex)
        self._mysql.count(sql,'order_count',callback=cb)

    def checkout_order(self, app_id, app_order, callback):
        query_cond = ["app_id={0} and my_order_id like {1}",app_id, "%s%%"%app_order]
        table_name = self.get_order_table_name()
        sql = construct_select_sql("select * from %s" % table_name, query_cond)
        def cb(result,ex):
            if ex:
                self.log_error("checkout_order error:sql(%s)", sql, exc_info=ex)
            else:
                callback(result,ex)
        self._mysql.query_hash(sql,callback=cb)

    def is_creating_order_exists(self,my_order_id,callback):
        query_cond = ["my_order_id = {0}",my_order_id]
        table_name = "creating_orders"
        #field = ["field"]
        sql = construct_select_sql("select * from %s"%(table_name),query_cond)
        self._mysql.query_hash(sql,callback=callback)


    def confirmed_order(self, app_id, my_order_id, theirs_order_id, platform_id=0):
        table_name = self.get_order_table_name()
        sql = construct_update_sql(table_name,
                {'confirmed': constant.SUCCEED, 'notifying_status': constant.SUCCEED, 'updated_at': MysqlExpr("NOW()")},
                [" app_id = {0} and my_order_id = {1} and theirs_order_id = {2}" , app_id, my_order_id, theirs_order_id] )

        def callback(result, ex):
            if result < 1:
                self.log_warning("confirmed_order nothing was updated:sql:%s", sql)
        self._mysql.update(sql,callback=callback)

    def update_order_info(self, app_id, my_order_id, theirs_order_id, info, callback=None):
        assert(type(info)==dict)
        info.update({'updated_at': MysqlExpr("NOW()")})
        table_name = self.get_order_table_name()
        where = [" app_id = {0} and my_order_id = {1} and theirs_order_id = {2}" , app_id, my_order_id, theirs_order_id]
        sql = construct_update_sql(table_name, info, where)
        self._mysql.update(sql,callback=callback)

    def save_order(self,packet,on_saved,value_pairs={}):
        new_params = dict(
            app_id = self._app['id'], user_id = str(packet.uiPlayerID), my_order_id = packet.szGameOrder,
            theirs_order_id = packet.szPlatformOrder, real_price = packet.fOrderMoney, ideal_price = packet.fOriginalMoney,
            order_status=constant.SUCCEED, notifying_status = constant.NOTIFYING, created_at = MysqlExpr("NOW()"),platform_id=packet.nPlatformID
        )
        new_params.update(value_pairs)
        sql = construct_insert_sql("orders",new_params)
        def callback(result,ex):
            if ex:
                self.log_error("save_order:sql:%s" % sql,exc_info=ex)
            else:
                self.log_info("save_order:(%(my_order_id)s)" % new_params)
            on_saved(result, ex)

        self._mysql.insert(sql,callback=callback)

    def save_order_extend(self,packet,value_pairs = {}):
        new_params = dict(
            created_at = MysqlExpr("NOW()")
            )
        new_params.update(value_pairs);

        def on_found2(result,ex):
            if ex:
                self.log_error("save_order_extend on_found2 err,err = %s"%ex)
            else:
                if len(result) <= 0:
                    self.log_error("orders not find order_id  = %s"%packet.szGameOrder)
                    return;

                new_params.update(order_id = result[0].get("id",0));
                sql = construct_insert_sql("payment_extensions",new_params);
                self._mysql.insert(sql,callback = None);

        def on_found(result,ex):
            if ex:
                self.log_error("save_order_extend on_found err,err = %s"%ex)
            else:
                if len(result) <= 0:
                    self.log_error("creating_orders not find order_id = %s"%packet.szGameOrder)
                    return;

                new_params.update(creating_order_id = result[0].get("id",0));
                query_cond = [ "my_order_id = {0}", packet.szGameOrder]
                table_name = "orders"
                sql = construct_select_sql("select id from %s"%(table_name),query_cond);
                self._mysql.query_hash( sql, callback=on_found2)


        query_cond = [ "my_order_id = {0}", packet.szGameOrder]
        table_name = "creating_orders"
        sql = construct_select_sql("select id from %s"%(table_name),query_cond);
        self._mysql.query_hash( sql, callback=on_found)

    def creating_order(self, params, on_created, value_pairs={}):
        new_params = dict(
            app_id = self._app['id'], user_id = self._app['user_id'], platform_id=params['nPlatformID'],my_order_id = params['szGameOrder'],
            server_id=params['nServerID'],real_price = params['fOrderMoney'], ideal_price = params['fOriginalMoney'],game_account_id = params['uiUserID'],
            item_id=params['uiGoodsID'],role_id=params['uiPlayerID'], role_name=params['szRoleName'],created_at = MysqlExpr("NOW()")
        )
        new_params.update(value_pairs)
        self.creating_order_with_http_params(new_params, on_created)

    def creating_order_with_http_params(self, params, on_created):
        table_name = "creating_orders"
        params = copy.deepcopy(params)
        params['created_at'] = MysqlExpr("NOW()")
        params['user_id'] = self._app['user_id']
        params['app_id'] = self._app['id']
        params['platform_id'] = self._platform_info['distributor_id']
        notify_url = params.pop('notify_url',"")
        notify_url_params = dict(
            app_id = self._app['id'], user_id = self._app['user_id'],
            url=notify_url, md5= hashlib.md5(notify_url).hexdigest(),
            created_at = MysqlExpr("NOW()"), updated_at = MysqlExpr("NOW()"),count = 1
        )

        notify_url_sql = construct_upsert_sql("notify_urls", notify_url_params, {'count': MysqlExpr('count + 1')})
        data_to_cache = dict(url=notify_url, ext=params.get("ext",""))

        def _on_created(create_order_sql, result,ex):
            if ex:
                self.log_error("creating_order_with_http_params:sql:%s" % create_order_sql,exc_info=ex)
                if hasattr(self, 'request_handler'):
                    self.request_handler.set_status(constant.HTTP_422, reason='unprocessable request')
                on_created(None,ex)
            else:
                real_my_order_id = "%s%s%s" % ( datetime.now().strftime("%Y%m%d%H%M%S"), result, int(time.time()) )
                update_sql = construct_update_sql(table_name,{'my_order_id': real_my_order_id},[" id = {0}" , result] )
                def my_order_id_updated(result, ex):
                    if ex:
                        if hasattr(self, 'request_handler'):
                            self.request_handler.set_status(constant.HTTP_422, reason='unprocessable request')
                        self.log_error("creating_order_with_http_params:sql:%s" % create_order_sql,exc_info=ex)
                    else:
                        self.log_info("creating_order_with_http_params: my_order_id:%s", real_my_order_id)

                    NotifyUrl.instance().set(real_my_order_id,data_to_cache)
                    on_created(real_my_order_id,ex)
                if params['my_order_id'].startswith('fake-'):
                    self._mysql.update(update_sql,callback=my_order_id_updated)
                else:
                    NotifyUrl.instance().set(params['my_order_id'], data_to_cache)
                    on_created(params['my_order_id'],None)

        def _on_upsert(result,ex):
            if ex:
                self.log_error("creating_order_with_http_params:sql:%s" % notify_url_sql, exc_info=ex)
            else:
                params['notify_url_id'] = result
                create_order_sql = construct_insert_sql(table_name,params)
                params.pop('created_at')
                self._mysql.insert(create_order_sql,callback=functools.partial(_on_created, create_order_sql))
        self._mysql.insert(notify_url_sql,callback=_on_upsert)

    def get_orders_confirmed(self,my_order_id,callback):
        query_cond = ["my_order_id = {0}",my_order_id]
        table_name = self.get_order_table_name()
        field      = "confirmed"
        sql        = construct_select_sql("select %s from %s"%(field,table_name),query_cond)

        def get_confirmed(result,ex):
            if ex:
                self.log_error("get_orders_confirmed err,sql = %s"%sql,exc_info=ex)
                callback(1)
            else:
                callback(result[0].get("confirmed"))

        self._mysql.query_hash(sql,callback=get_confirmed)

if __name__ == "__main__":
    pass
