#!/usr/bin/env python
#-*- coding:utf-8 -*-
import json
import utils
from common.game_center import GameCenterMixin


class LoginMixin(object):
    
    def login_bind(self, account, platform_id, remark='0'):
        '''send player account to zqb account center'''
        def on_response(user_data, res):
            succeed = False
            if not res.error:
                succeed = True
                ret = json.loads(res.body)
                if str(ret['status']) == '200':
                    self.log_info("bind account success:(%s)(%s)"%(user_data, ret))
                elif str(ret['status']) == '501':
                    self.log_warning("repeat bind:(%s)(%s)"%(user_data, ret))
                else:
                    succeed = False
            if not succeed:
                self.log_error("bind account error:(%s), %s, %s"%(user_data, res.error, res.body))
        account = utils.to_utf8(account)
        remark = utils.to_utf8(remark)
        url = GameCenterMixin.get_bind_url(account, platform_id, remark)
        user_data = {'account': account, 'platform_id': platform_id, 'remark': remark}
        self.request_get(url, {}, on_response, user_data)



if __name__=='__main__':
    
    import tornado.ioloop
    h = LoginMixin()
        
    h.bind_account('zqb1004', 1, "中文")
    tornado.ioloop.IOLoop.instance().start()
