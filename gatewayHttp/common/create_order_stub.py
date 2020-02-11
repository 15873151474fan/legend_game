#encoding:utf-8
""" default create_order """
import os
import time
import json
import functools

import command
import constant
from utils.log_mixin import LogMixin
from utils.http_mixin import HttpMixin
from common.order_mixin import OrderMixin
from utils.gateway_mixin import GatewayMixin
from common.sign_mixin import SignMixin


class CreateOrderStub(GatewayMixin, HttpMixin, LogMixin, OrderMixin, SignMixin):
    """ CreateOrderStub """
    logBaseDir = "common"
    keys = ("app_id", "game_account_id", "my_order_id", "real_price", "ideal_price", "notify_url", "server_id", "item_id", "role_id", "role_name", "ext", "sign")
    
    def __init__(self, gateway, **kwargs):
        '''initial base info'''
        super(CreateOrderStub, self).__init__(gateway)
        self._app = kwargs['app']
        self._mysql = kwargs['mysql']
        self._platform_info = kwargs['platform_info']

    def generate_fake_order_number(self, request_handler):
        remote_ip, remote_port = request_handler.request.connection.stream.socket.getpeername()
        s = "fake-%s-%s-%f-%s-%s" % (remote_ip, remote_port, time.time(), os.getpid(), request_handler.get_request_count())
        return s
        
    def after_create_myorder(self, packet, callback):
        if not isinstance(packet, dict):
            ret_packet = command.AS2PSReturnPlatformOrderCommand.from_request(packet)
            ret_packet.nStatus = constant.SUCCEED
            ret_packet.szNoticeUrl = OrderMixin.get_pay_notice_url(self._app,packet.nPlatformID)
            callback(ret_packet)
        else:
            packet['status'] = constant.SUCCEED
            packet['notify_url'] = OrderMixin.get_pay_notice_url(self._app, int(self._platform_info['distributor_id']))
            packet['sign'] = self.calc_sign(packet)
            self.request_handler.finish(chunk = json.dumps(packet))
        
    def create_myorder_error(self, packet, callback):
        if not isinstance(packet, dict):
            ret_packet = command.AS2PSReturnPlatformOrderCommand.from_request(packet)
            ret_packet.nStatus = constant.FAILED
            callback(ret_packet)
        else:
            packet['status'] = constant.FAILED
            self.request_handler.finish(chunk = json.dumps(packet))
        
    def on_create_myorder(self, packet, callback, result, ex):
        if ex:
            self.create_myorder_error(packet, callback)
        else:
            if not isinstance(packet, dict) and packet.szGameOrder.startswith('fake-'):
                packet.szGameOrder = result
            elif isinstance(packet, dict) and packet['my_order_id'].startswith('fake-'):
                packet['my_order_id'] = result
            self.after_create_myorder(packet, callback)
            
    def create_order(self, packet, callback):
        if not isinstance(packet, dict):
            params = dict(
                my_order_id = packet.szGameOrder,server_id = packet.nServerID, game_account_id = packet.uiUserID,role_id = packet.uiPlayerID,
                ideal_price = packet.fOriginalMoney,real_price = packet.fOrderMoney,item_id = packet.uiGoodsID, role_name = packet.szRoleName
            )
        else:
            params = dict(
                my_order_id = packet.get('my_order_id'),server_id = packet['server_id'], game_account_id = packet['game_account_id'],role_id = packet['role_id'],ext=packet.get('ext',''),
                notify_url = packet['notify_url'],ideal_price = packet['ideal_price'],real_price = packet['real_price'],item_id = packet['item_id'], role_name = packet['role_name']
            )
            
        self.creating_order_with_http_params(params, functools.partial(self.on_create_myorder,packet,callback))
        
    def process(self, request_handler, params):
        if 'my_order_id' not in params or not params['my_order_id']:
            params['my_order_id'] = self.generate_fake_order_number(request_handler)
        
        self.request_handler = request_handler
        self.create_order(params, None)
        return True
    
    def check_sign(self,params):
        theirs_sign = params.pop("sign",None)
        if theirs_sign:
            return theirs_sign == self.calc_sign(params)
        
    def get_params_keys(self):
        return self.keys
    

def test():
    '''test query_order'''
    import settings
    from utils.async_mysql import AsyncMysql
    from tornado.options import options,define
    define("mode", default="development", help="default run in development mode", type=str)
    packet = command.PS2ASCreatePlatformOrderCommand()
    packet.uiUserID = 1001
    packet.nServerID = 1
    packet.nPlatformID = 27
    packet.szGameOrder = str(int(time.time()))
    packet.szGameOrder = "fake-" + str(int(time.time()))
    packet.fOrderMoney = 10
    packet.fOriginalMoney = 10
    packet.uiPlayerID = 1001
    packet.uiGoodsID = 10
    packet.szRoleName = "fake"
    platform_info = dict(dist_app_id=None,dist_app_key=None,distributor_id=27)
    options.mode="development"
    mysql = AsyncMysql(settings.database_configs['development'])
    co = CreateOrderStub(None, mysql=mysql, app={'simple_name':'hycs','id': 102334155,'user_id':'100000001'}, platform_info = platform_info )
    
    def callback(repacket):
        print("nPlatformID:%s"%repacket.nPlatformID) # 平台ID, 在上面枚举里面定义
        print("szPlatformOrder:%s"%repacket.szPlatformOrder) # 订单号
        print("szGameOrder:%s"%repacket.szGameOrder) # 订单号
        print("nServerID:%s"%repacket.nServerID) # 充值的目标服务器，一个玩家可能在多个服务器上都有角色，所以需要知道他在哪个服务器充值
        print("uiUserID:%s"%repacket.uiUserID) # 用户在游戏内部平台服上的玩家ID
        print("uiPlayerID:%s"%repacket.uiPlayerID) # 用户在游戏内部游戏服上的ID
        print("fOriginalMoney:%s"%repacket.fOriginalMoney) # 原价(格式:0.00),购买时应用传入的单价*总数,总原价
        print("fOrderMoney:%s"%repacket.fOrderMoney) # 实际价格(格式:0.00),购买时应用传入的单价*总数,总实际 价格
        print("uiGoodsID:%s"%repacket.uiGoodsID) # 用户买了什么商品
        print("uiGoodsCount:%s"%repacket.uiGoodsCount) # 用户买了多少个
        print("szDataEx:%s"%repacket.szDataEx)  # 扩展数据长度, hw作为sign #MAX_EXTERN_DATA_LEN
        print("nStatus:%s"%repacket.nStatus) # 0 成功, 1 失败
        print("szNoticeUrl:%s"%repacket.szNoticeUrl) #充值回调链接，没有就默认为空
    
    co.create_order(packet, callback)


if __name__=='__main__':
    import tornado.ioloop
    test()
    tornado.ioloop.IOLoop.instance().start()
