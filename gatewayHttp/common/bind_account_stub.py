#encoding:utf-8
""" default bind phone number """
import json

import utils
from common.sign_mixin import SignMixin
from utils.gateway_mixin import GatewayMixin
from common.game_center import GameCenterMixin


class BindAccountStub(GatewayMixin, GameCenterMixin, SignMixin):
    logBaseDir = "common"
    keys = ('platform_id', 'server_id', 'player_id', 'account', 'user_id', 'phone', 'code', 'ext', 'sign')

    def __init__(self, gateway, **kwargs):
        '''initial base info'''
        super(BindAccountStub, self).__init__(gateway)
        self._app = kwargs['app']
        self._mysql = kwargs['mysql']
        self._platform_info = kwargs['platform_info']

    def get_params_keys(self):
        return BindAccountStub.keys

    def check_sign(self,params):
        theirs_sign = params.get("sign",None)
        if theirs_sign:
            return theirs_sign == self.calc_sign(params)

    def process(self, request_handler, params):
        def on_bind_account(res,msg):
            if res:
                ret_json = json.dumps(dict(status=200,data=res))
                request_handler.write(ret_json)
                request_handler.finish()
            else:
                ret_json = json.dumps(dict(status=403,data=msg))
                request_handler.write(ret_json)
                request_handler.finish()

        self.bind_account(params, on_bind_account)
        return True

    def bind_account(self, params, callback):
        account, phone, code = utils.to_utf8(params.get('account','')), params['phone'], params.get('code','')
        server_id, user_id, player_id = params.get('server_id', 0),params.get('user_id',0), params.get('player_id', '0')
        if not phone or not isinstance(phone, (str, unicode)) or not phone.isdigit():
            self.log_error("reject deal with bad phone number:%s"%phone)
            return
        platform_id = int(self._platform_info['distributor_id'])
        self.log_info("bind_account params:(%s)"%params)
        if not (code and code.strip()):
            url = self.apply_verify_code(account or player_id, platform_id, phone)
        else:
            url = self.get_verify_code_url(account or player_id, platform_id, phone, code)
        user_data = dict(server_id=server_id, player_id=player_id, account=account, phone=phone, code=code, callback=callback)
        self.request_get(url, {}, self.on_bind_account, user_data)


    def on_bind_account(self, user_data, res):
        result, msg, callback = 3, None, user_data.pop('callback')
        result_dict = {'200': 0, '502': 1, "503": 2, '201': 4}
        if not res.error:
            ret = json.loads(res.body)
            result = result_dict.get(str(ret['status']), 3)

        if result not in (0, 2):
            self.log_error("on_bind_account error: user_data(%s) body(%s) error(%s)"%(user_data, res.body, res.error))
        else:
            self.log_info("on_bind_account success: user_data(%s) body(%s)"%(user_data, res.body))

        if not user_data.get('code','') and result != 4:
            return
        if not hasattr(callback,'args'):
            msg = user_data
            msg.pop('account', None)
            msg['result'] = result
            result = msg if result == 0 else False
        callback(result, msg)



