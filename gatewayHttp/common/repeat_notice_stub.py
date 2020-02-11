#encoding: utf-8
""" common repeat_notice """
import command
import constant
from utils.log_mixin import LogMixin
from utils.http_mixin import HttpMixin
from common.order_mixin import OrderMixin
from utils.gateway_mixin import GatewayMixin

class RepeatNoticeStub(GatewayMixin,HttpMixin,LogMixin,OrderMixin):
    """common.RepeatNotice"""
    logBaseDir = "common"
    keys = ['app_id','platform_id','server_id','role_id','my_order_id', 'theirs_order_id', 'ideal_price', 'real_price', 'notify_url_id', 'notifying_status']

    def __init__(self, gateway, **kwargs):
        """initialize"""
        super(RepeatNoticeStub, self).__init__(gateway)
        self._app = kwargs['app']
        self._mysql = kwargs['mysql']
        self._platform_info= kwargs['platform_info']
        
    def on_repeat_notice(self, params):
        ''''''
        self.log_info("recv qq repeat_notice request, params:(%s)"%params)
        packet = command.AS2PSRechargeCommand()
        packet.uiTalkingSDKAppId = int(params['app_id']) or int(self._app["id"])
        packet.nPlatformID     = int(params.get('platform_id', self._platform_info['distributor_id']))
        packet.szPlatformOrder = params['theirs_order_id']
        packet.szGameOrder     = params['my_order_id']
        packet.uiPlayerID      = int(params['role_id'])
        packet.fOriginalMoney  = float(params['real_price'])
        packet.fOrderMoney     = float(params['ideal_price'])
        packet.nStatus         = 2
        self.gateway.send(packet,app=self._app)
        self.request_handler.write('202')
        self.request_handler.finish()

    def process(self, request_handler, params):
        '''处理http请求'''
        self.request_handler = request_handler

        if self.is_order_success(params):
            self.on_repeat_notice(params)
        else:
            self.log_error("order failed:(%s,)",repr(params))
            self.request_handler.write('202')
            self.request_handler.finish()
        return True

    def check_sign(self,*args):
        return True

    def get_params_keys(self):
        return RepeatNoticeStub.keys

    def is_order_success(self, params):
        return True


def test():
    '''test query_order'''
    packet = command.PS2ASRechargeQueryCommand()
    packet.nPlatformID = 27
    packet.szGameOrder = '20150423142207002739'
    packet.nZoneID = 1
    packet.nMoney = 10
    packet.nEmoney = 1
    packet.ntype = 0
    packet.szQueryParam = '{\"openkey\":\"5BA0FDFE0554EF95ED8BC6E0D40DB914\",\"pay_token\":\"5D2BD60E4B11D12E39BAD5B89B744656\",\"pf\":\"desktop_m_qq-73213123-android-73213123-qq-1104477307-1AB458CDBF4F9205BCE4CD9FD79003E2\",\"openid\":\"1AB458CDBF4F9205BCE4CD9FD79003E2\",\"pfkey\":\"44eb8e8126a2b50e6dca9a039a2cff74\",\"zoneid\":\"1\"}'
    #packet.szQueryParam = "{\"openkey\":\"5BA0FDFE0554EF95ED8BC6E0D40DB914\",\"pay_token\":\"81B3D696FE5B320E5A8DDD920CD39BD1\",\"pf\":\"desktop_m_qq-73213123-android-73213123-qq-1104477307-1AB458CDBF4F9205BCE4CD9FD79003E2\",\"openid\":\"1AB458CDBF4F9205BCE4CD9FD79003E2\",\"pfkey\":\"22905682f0b43a58c3ed4541195c9d34\"}"  #openkey, openid, pay_token, pf, pfkey
    platform_info = dict(dist_app_id=config.APPID,dist_app_key=config.APPKEY)
    print('len:%s'%len(packet.szQueryParam))
    co = RepeatNoticeStub(None, mysql=None, app={'id': 102334155, 'user_id':'100000001'}, platform_info = platform_info )
    co.process({'my_order_id': '20150423142207002739'})


if __name__=='__main__':
    import tornado.ioloop
    test()
    tornado.ioloop.IOLoop.instance().start()


