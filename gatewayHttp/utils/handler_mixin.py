#!/usr/bin/env python
#-*- coding:utf-8 -*-
import traceback

import platform_defines
from utils.log_mixin import LogMixin
from utils.mysql import construct_select_sql

class HandlerMixin(LogMixin):
    logBaseDir = "HandleMixin"
    
    def handle_request(self, app_id, platform_id, handler_name, handler_func, *args, **kwargs):
        def on_find_handler(handler):
            if not handler:
                self.log_error("handler_request error, not find handler, app_id:%s, platform_id:%s"%(app_id, platform_id))
                return False
            try:
                return getattr(handler, handler_func)(*args, **kwargs)
            except:
                exc_info = traceback.format_exc()
                err_msg = "platform_id:%s, handler_name:%s, handler_func:%s error:(%s)"%(platform_id,handler_name,handler_func, exc_info)
                self.log_error(err_msg)
            return False
        def on_app_found(app):
            self.find_handler(app, platform_id, handler_name, on_find_handler)
        self.find_app(app_id, on_app_found)
    
    def find_app(self, app_id, on_app_found):
        if not app_id:
            return on_app_found(None)
        def cb(result, ex):
            app = None
            if ex or not result:
                self.log_error("find_app error, sql:%s", sql, exc_info=ex)
            else:
                app = result[0]
            on_app_found(app)
        fields = "id, simple_name, user_id, `key`, pay_notice_url, active, approved"
        sql = "SELECT %s FROM apps WHERE id=%s "%(fields, app_id)
        self._mysql.query_hash(sql, callback = cb)
        
    def find_handler(self, app, platform_id, handler_name, on_find_handler):
        if not (app and platform_id):
            return on_find_handler(None)
        def cb(result, err):
            handler = None
            if err or not result:
                self.log_error("find_handler error, sql:%s", sql, exc_info=err)
            else:
                handlers = platform_defines.get_platform_by_id(platform_id)
                if handlers and handler_name in handlers:
                    handler = handlers[handler_name](self,mysql=self._mysql, platform_info=result[0], app=app)
            on_find_handler(handler)
        where = " app_id=%s AND distributor_id=%s "%(int(app['id']), platform_id)
        sql = "SELECT * FROM distribution_infos WHERE %s"%where
        self._mysql.query_hash(sql, callback = cb)
        
        
        

