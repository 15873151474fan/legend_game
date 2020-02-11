#-*- coding:utf-8 -*-
import time
import json
import urllib
import hashlib

import utils
import platform_defines
from utils.log_mixin import LogMixin
from utils.http_mixin import HttpMixin

class GameCenterMixin(HttpMixin, LogMixin):
    '''send third account to zqb api center'''

    APPID = "0019009"
    APPKEY = "fY6AsCL0SVK8b2KBowHlD7eTnKMXmrim"
    SECRET_KEY = "dEKX3TGgGKolb6b3IMbco7RiOh8anCr7"
    LOGIN_BIND_URL = "http://api.zqgame.com/thirdAccountBind/"
    APPLY_CODE_URL = "http://api.zqgame.com/applyThirdPassPhone/"
    VERIFY_CODE_URL = "http://api.zqgame.com/thirdAccountBindPhone/"

    GAME_CENTER_VERSION = "1.0"
    GAME_CENTER_URL = "http://tongji.api.zqgame.com/"

    @staticmethod
    def get_sys_param():
        return '2.0' + ':' + GameCenterMixin.APPKEY + ':' + str(int(time.time()*1000000))

    @staticmethod
    def get_bind_url(account, platformid, remark='0'):
        account = utils.to_utf8(account)
        thirdcode = "zqb" + str(platformid)
        sysparam = GameCenterMixin.get_sys_param()
        params = [account, thirdcode, GameCenterMixin.APPID, urllib.quote(utils.to_utf8(remark)), sysparam]
        uri = '/'.join(params)
        sign_str = ''.join(params)
        sign = hashlib.md5(sign_str+GameCenterMixin.SECRET_KEY).hexdigest().lower()
        return GameCenterMixin.LOGIN_BIND_URL + uri + '/' + sign

    @staticmethod
    def apply_verify_code(account, platformid, phone, remark='0'):
        account = utils.to_utf8(account)
        thirdcode = "zqb" + str(platformid)
        sysparam = GameCenterMixin.get_sys_param()
        params = [account, thirdcode, phone, GameCenterMixin.APPID, urllib.quote(utils.to_utf8(remark)), sysparam]
        uri = '/'.join(params)
        sign_str = ''.join(params)
        sign = hashlib.md5(sign_str+GameCenterMixin.SECRET_KEY).hexdigest().lower()
        return GameCenterMixin.APPLY_CODE_URL + uri + '/' + sign

    @staticmethod
    def get_verify_code_url(account, platformid, phone, code, remark='0'):
        account = utils.to_utf8(account)
        thirdcode = "zqb" + str(platformid)
        sysparam = GameCenterMixin.get_sys_param()
        params = [account, thirdcode, phone, code, GameCenterMixin.APPID, urllib.quote(utils.to_utf8(remark)), sysparam]
        uri = '/'.join(params)
        sign_str = ''.join(params)
        sign = hashlib.md5(sign_str+GameCenterMixin.SECRET_KEY).hexdigest().lower()
        return GameCenterMixin.VERIFY_CODE_URL + uri + '/' + sign

    #推送订单信息到中心统计
    def push_order_to_platform(self, game_order, amount, plat_order='', serverid=0, platid=0, gameid=0, ip='', mac=''):
        def callback1(result, err):
            if not err and result:
                gameid = result[0]['dist_app_id']
            def callback2(result, err):
                ts = int(time.time())
                order_info = {} if err or not result else result[0]
                pushData = {
                    'platformid': int(order_info.get('platform_id', 0) or platid or self._platform_info['distributor_id']),
                    'gameorder': game_order,
                    'platformorder': plat_order,
                    'amount': amount or float(order_info.get('real_price', 0.0)) ,
                    'serverid': int(serverid or order_info.get('server_id', 0)),
                    'roleid': int(order_info.get('role_id', 0)),
                    'rolename': order_info.get('role_name', ''),
                    'sdkgameid': int(self._app['id']),
                    'gameid': gameid,
                    'ip': ip,
                    'mac': mac,
                    'paydate': time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(ts)),
                }
                self._push_info_to_platform('pay', pushData, ts)
            self.is_creating_order_exists(game_order, callback2)
        if not gameid:
            self.get_zqb_gameid(platid, callback1)
        else:
            callback1(None, None)

    def push_login_to_platform(self, userid, token, username="", platid=0, gameid=0, mac='', ip='', idfa=''):
        platid = platid or int(self._platform_info['distributor_id'])
        def callback(result, err):
            ts = int(time.time())
            pushData = {
                'userid': userid,
                'token': token,
                'username': username,
                'platformid': platid,
                'gameid': int(result[0]['dist_app_id']) if not err and result else gameid,
                'sdkgameid': int(self._app['id']),
                'ip': ip,
                'mac': mac,
                'idfa': idfa,
            }
            self._push_info_to_platform("login", pushData, ts)
        if not gameid:
            self.get_zqb_gameid(platid, callback)
        else:
            callback(None, None)

    def get_zqb_gameid(self, platid, callback):
        platid = platform_defines.get_zqb_platid(platid or self._platform_info['distributor_id'])
        sql = "select dist_app_id from distribution_infos where app_id=%s and distributor_id=%s"%(self._app['id'], platid)
        self._mysql.query_hash(sql, callback=callback)

    def _push_info_to_platform(self, where, pushData, ts):
        sign_str = urllib.urlencode(pushData)
        sign = hashlib.md5("1.0"+sign_str+self.APPID+str(ts*1000)+self.SECRET_KEY).hexdigest().lower()
        url = self.GAME_CENTER_URL+where+"/"+self.GAME_CENTER_VERSION+"/"
        url = url + sign_str+'/'+self.APPID+'/'+str(ts*1000)+'/'+sign
        def on_response(user_data, res):
            succeed = False
            if not res.error and str(json.loads(urllib.unquote(res.body)).get('status', 0)) == '200':
                succeed = True
                self.log_info("_push_info_to_platform succeed: %s, %s", where, str(pushData))
            if not succeed:
                self.log_error("_push_info_to_platform failed: %s, %s, body:%s, error:%s", where, str(pushData), res.body, res.error)
        self.log_debug("url:%s", url)
        user_data = {'path': where, 'pushData': pushData, 'ts': ts}
        self.request_get(url, {}, on_response, pushData)



if __name__=='__main__':
    import os
    import sys
    import json
    root_path=os.path.join(os.path.dirname(__file__),'../')
    sys.path.append(root_path)
    import tornado.ioloop
    from utils.log_mixin import LogMixin
    from utils.http_mixin import HttpMixin

    s = "http://api.zqgame.com/thirdAccountBind/juanbao198910/0/31/0/2.0:CcLvMBL6Lf0npprrzNaNfTDUuwtXN5Yk:1331263863961000/ce808245421dff78dcf554f7e089d905"
    t = "http://api.zqgame.com/thirdAccountBind/zqb1001/zqb1/0019009/0/2.0:fY6AsCL0SVK8b2KBowHlD7eTnKMXmrim:1433840586900703/ed97c171d921aff227186a1cb6380746"
    class Get(HttpMixin,LogMixin):
        pass
    h = Get()
    url = GameCenterMixin.get_bind_url('zsld001', 1)
    url = GameCenterMixin.get_verify_code_url('zsld001', 1,'15902077742','9241')
    print url

    def callback(params, res):
        print params
        print res.error
        print type(res.body),json.loads(res.body)

    h.request_get(url,{},callback)
    tornado.ioloop.IOLoop.instance().start()


