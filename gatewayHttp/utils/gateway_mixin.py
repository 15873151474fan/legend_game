#encoding: utf-8
import command
from tornado.ioloop import IOLoop
import functools
class GatewayMixin(object):
    def __init__(self,gateway):
        self.gateway = gateway

    def send_pay_notice(self, platform_id, my_order_id, theirs_order_id, amount, **kwargs):
        packet = command.AS2PSRechargeCommand()
        packet.nPlatformID     = platform_id
        packet.szPlatformOrder = theirs_order_id
        packet.szGameOrder     = my_order_id
        packet.uiPlayerID      = int(kwargs.get('uid',0))
        packet.fOriginalMoney  = amount
        packet.fOrderMoney     = amount
        packet.nStatus         = 2
        self.gateway.send(packet,app=self._app)

    def check_pay_confirmed(self,packet,rep_num = 3):
        if rep_num == 0:
            self.log_error("check_pay_confirmed failed packet:(%s)"%packet)
            return;

        def get_confirmed(confirmed):
            if int(confirmed) == 1:
                return;
            self.log_info("repeat game pay rep_num = %s,packet = (%s)"%(rep_num,packet))
            self.gateway.send(packet,app=self._app)
            IOLoop.instance().call_later(10, functools.partial(self.check_pay_confirmed, packet,rep_num = rep_num - 1))

        self.get_orders_confirmed(packet.szGameOrder,callback = get_confirmed)