import functools
import tornado.iostream
import tornado.httpclient
from tornado import log
from tornado.options import define, options, parse_command_line

import command
from utils.http_mixin import HttpMixin
from utils.log_mixin import LogMixin
from utils.mysql import construct_select_sql
from common.order_mixin import OrderMixin
from common.sign_mixin import SignMixin
from common.notify_url import NotifyUrl
import platform_defines
import settings
import constant
import utils

class WebGateway(LogMixin,HttpMixin,SignMixin):
    def __init__(self, *args, **kwargs):
        self._mysql = kwargs['mysql']
        NotifyUrl.set_database_connection(self._mysql)


    def send(self, packet, **kwargs):
        # platform_info = kwargs["platform_info"]
        app   = kwargs["app"]
        self._app = app
        app_id= int(app["id"])
        data_cached = NotifyUrl.instance().get(packet.szGameOrder)
        params = {
            'platform_id': packet.nPlatformID,
            'my_order_id': packet.szGameOrder,
            'theirs_order_id': packet.szPlatformOrder,
            'real_price': packet.fOrderMoney,
            'status': 200 if packet.nStatus == 2 else 402
        }
        pay_notice_url = None
        if data_cached:
            pay_notice_url = data_cached['url']
            ext            = data_cached['ext']
            params['ext']  = ext

        #params['sign'] = self.calc_sign(params)

        def _on_http_response(user_data,res):
            succeed= False
            if not res.error:
                if res.body == "200":
                    # succeed
                    succeed = True
                    self.update_order_notification(app_id, params["my_order_id"], constant.SUCCEED )
                    self.update_order_status(app_id, params["my_order_id"], constant.SUCCEED)
                    NotifyUrl.instance().delete(packet.szGameOrder)
                else:
                    # error
                    self.log_error("pay_notice_invoke: res failed,%s", res.body)
            else:
                self.log_error("pay_notice_invoke: failed,%s,%s", res.error, res.body)
            if not succeed:
                # save to queue
                status = constant.NOTIFYING
                self.update_order_notification(app_id, params["my_order_id"], status)
                self.update_order_status(app_id, params["my_order_id"], status)

        def on_created(ext, url, params):
            params['ext'] = ext
            params['sign'] = self.calc_sign(params)
            self.request_get(url,params,_on_http_response)

        def _on_notify_url_found(result, ex):
            if ex:
                pass
            else:
                pay_notice_url = result['url']
                ext            = utils.to_utf8(result['ext']) or ''
                self.save_order_notification(app, pay_notice_url, params, functools.partial(on_created, ext ))

        if pay_notice_url is None:
            NotifyUrl.instance().find_by_my_order_id(params['my_order_id'], _on_notify_url_found)
        else:
            result = dict(url=pay_notice_url, ext = ext )
            _on_notify_url_found(result, None)

    def start(self):
        pass



def main():
    define("game_host", default=settings.game_host, help="run on the given port", type=int)
    define("game_port", default=settings.game_port, help="run on the given port", type=int)

    parse_command_line()
    platform_defines.import_platforms()
    tornado.ioloop.IOLoop.instance().start()

if __name__ == '__main__':
    main()
