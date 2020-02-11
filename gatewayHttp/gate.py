#!/usr/bin/env python
from __future__ import print_function
import sys
import os.path
import socket
import tornado.web
import tornado.ioloop
import tornado.httpclient
from tornado import log
from tornado.options import define, options, parse_command_line
from tornado.netutil import Resolver
import constant
from gateway import WebGateway
import platform_defines
import settings
from utils import get_listening_address
from utils.async_mysql import AsyncMysql
from utils.stats_mixin import StatsMixin
from utils.mysql import construct_select_sql
from common.sign_mixin import SignMixin
import json

class Web(tornado.web.RequestHandler,StatsMixin):
    def initialize(self, gateway,mysql):
        self._gateway = gateway
        self._mysql   = mysql

    def find_handler(self, app, platform_name, action, on_find_handler):
        platform_id = platform_defines.name_to_id(platform_name)
        if platform_id:
            query_cond = ["app_id = {0} and distributor_id = {1} ",int(app["id"]),platform_id]
            table_name = "distribution_infos"
            fields = "app_id, user_id, distributor_id, dist_app_id, dist_app_key, dist_app_secret, dist_app_vendor, meta, dist_app_public_key,dist_app_private_key"
            sql = construct_select_sql("select %s from %s inner join apps on %s.app_id = apps.id " % (fields, table_name, table_name), query_cond)
            def cb(result,ex):
                try:
                    if ex:
                        log.app_log.error("find_handler:sql:%s", sql, exc_info=ex)
                    else:
                        if len(result) == 1:
                            platform_info = result[0]
                            handlers = platform_defines.get_platform_by_id(platform_id)
                            if handlers:
                                if action in handlers :
                                    handler = handlers[action](self._gateway,mysql=self._mysql, platform_info=platform_info, app=app)
                                    if not handler:
                                        raise NameError("action %s not exists" % action)
                                else:
                                    self.set_status(constant.HTTP_405, reason='handler not found')
                                    raise NameError("(platform,action)(%s,%s) not exists" % (platform_name,action))
                            else:
                                raise NameError("platform_handler id %s not exists" % platform_id)
                        else:
                            raise NameError("distribution_info(%s,%s) not exists" % (app["id"],platform_id))
                except:
                    self.finish()
                    raise
                on_find_handler(handler)
            self._mysql.query_hash(sql,callback=cb)
        else:
            raise NameError("platform %s not exists" % platform_name)

    def find_app(self, app_id, on_app_found ):
        if app_id:
            query_cond = ["id = {0}", app_id]
            table_name = "apps"
            fields = "id, simple_name, user_id, `key`, pay_notice_url, active, approved"
            sql = construct_select_sql("select %s from %s" % (fields, table_name), query_cond)
            def cb(result,ex):
                if ex:
                    log.app_log.error("find_app:sql:%s", sql, exc_info=ex)
                else:
                    app_info = result[0]
                    on_app_found( app_info )
            self._mysql.query_hash(sql,callback=cb)

    def prepare(self):
        self.__class__.increase_request_count()

    @tornado.web.asynchronous
    def post(self,app_id,platform,action):
        log.access_log.info("POST uri: %s, body: %s" % (self.request.uri, self.request.body))
        def on_app_found(app):
            self._app = app
            self.find_handler(app,platform,action,self.on_find_handler)
        self.find_app(app_id, on_app_found )

    @tornado.web.asynchronous
    def get(self,app_id,platform,action):
        log.access_log.info("GET uri: %s, argument: (%s)" % (self.request.uri,str(self.request.arguments)))
        # def on_app_found(app):
            # self._app = app
            # self.find_handler(app,platform,action,self.on_find_handler)
        # self.find_app(app_id, on_app_found )
        ip = self.get_argument("ip")
        if ip:
            query_cond = ["ip = {0}", ip]
            table_name = "gateways"
            fields = "id,url_zone,url_user,redis_server_id"
            sql = construct_select_sql("select %s from %s" % (fields, table_name), query_cond)
            def cb(result,ex):
                if ex:
                    log.app_log.error("find_app:sql:%s", sql, exc_info=ex)
                    self.finish()
                else:
                    app_info = result[0]
                    print(app_info)
                    self.finish("%s,%s,%s,%s;"%(app_info["id"],app_info["url_zone"],app_info["url_user"],app_info["url_user"]))
            self._mysql.query_hash(sql,callback=cb)

    def on_find_handler(self, handler):
        self.handler = handler
        if self.handler:
            if hasattr(self.handler,'parse_params'):
                params = self.handler.parse_params(self)
            # for Login
            elif hasattr(self.handler,"collect_params"):
                params = self.handler.collect_params(self)
            elif hasattr(self,'get_params_keys'):
                params = self.collect_params(self.get_params_keys())
            else:
                params = self.collect_params(self.handler.get_params_keys())

            handle_by_handler = False
            checked = False

            # for Login and CreatOrder
            if hasattr(self,'check_sign'):
                checked = self.check_sign(params)
            else :
                checked = self.handler.check_sign(params)

            if checked:
                handle_by_handler = self.handler.process(self,params)
                if not handle_by_handler:
                    self.set_status(constant.HTTP_422, reason='unprocessable request')
            else:
                self.set_status(constant.HTTP_401, reason='sign not match')
                log.app_log.warning("sign not match,%s" % repr(params))

            if not handle_by_handler:
                self.finish()


    def collect_params(self,keys):
        params  = {}
        for key in keys:
            p = self.get_argument(key,None)
            if p:
                params[key] = p
        return params

class Login(Web,SignMixin):

    def on_login_callback(self,succeed,msg):
        if succeed:
            self.write({'status': 200, 'data': succeed})
        else:
            self.write({'status': 403, 'data': msg})
        self.finish()

    def check_sign(self,params):
        theirs_sign = params.get("sign",None)
        if theirs_sign:
            return theirs_sign == self.calc_sign(params)


class CreateOrder(Web):
    pass

def start():
    try:
        platform_defines.import_platforms()
        mysql = AsyncMysql(settings.database_configs[options.mode])

        game_server = settings.game_servers[options.mode]
        gateway = WebGateway(game_server['host'], game_server['port'],mysql=mysql)

        gateway.start()
        application = tornado.web.Application([
            (r'/(?P<app_id>[^/]+)/(?P<platform>[^/]+)/(?P<action>login_request)', Login, dict(gateway=gateway,mysql=mysql)),
            (r'/(?P<app_id>[^/]+)/(?P<platform>[^/]+)/(?P<action>create_order)', CreateOrder, dict(gateway=gateway,mysql=mysql)),
            (r'/(?P<app_id>[^/]+)/(?P<platform>[^/]+)/(?P<action>[^/]+)', Web, dict(gateway=gateway,mysql=mysql)),
        ])
        log.gen_log.info("listening on %s",  options.port)
        application.listen(options.port)
        tornado.ioloop.IOLoop.instance().start()
    except (KeyboardInterrupt):
        mysql.stop()
        tornado.ioloop.IOLoop.instance().stop()
    except (Exception,socket.error):
        if settings.daemon:
            import traceback
            traceback.print_exc(100,open(settings.main_log_file,"a+"))
        else:
            raise
def is_process_exists(pid):
    try:
        os.getpgid(pid)
    except Exception,e:
        if e.errno == 3:
            return False

    return True

def daemon_running(pid_file):
    if os.path.exists(pid_file):
        pid = int(open(pid_file).read())
        if is_process_exists(pid):
            print("process(%d) is running", pid, file=sys.stderr)
            return True
        else:
            print("process(%d) is not running,remove pid file", pid, file=sys.stderr)
            os.remove(pid_file)
    return False

def main():

    # using CaresResolver as DNS resolver
    # see also: http://www.tornadoweb.org/en/branch3.0/caresresolver.html
    Resolver.configure('tornado.platform.caresresolver.CaresResolver')
    # CurlAsyncHTTPClient to be used as httpclient subclass
    tornado.httpclient.AsyncHTTPClient.configure("tornado.curl_httpclient.CurlAsyncHTTPClient")

    define("port", default=8080, help="run on the given port", type=int)
    # define("address", default=get_listening_address(), help="run on the given address", type=str)
    define("daemon", default=settings.daemon, help="run as daemon", type=bool)
    define("webgate", default=settings.webgate, help="run on web gate mode", type=bool)
    define("log_to_file", default=False, help="log to file", type=bool)
    define("game_host", default=settings.game_servers['development']['host'], help="bind address", type=str)
    define("game_port", default=settings.game_servers['development']['port'], help="run on the given port", type=int)
    define("mode", default="development", help="default run in development mode", type=str)
    if '--daemon' not in sys.argv:
        parse_command_line(sys.argv + ['--log_to_stderr'])
    else:
        parse_command_line(final=False)

    game_server = settings.game_servers[options.mode]
    assert(game_server)
    if options.daemon:
        from lockfile.pidlockfile import PIDLockFile
        import daemon
        main_log = open(settings.main_log_file,"a+")
        pid_file = os.path.join(settings.ROOT, "pids","%s-%s.pid" % (settings.APPNAME, options.port))
        if not daemon_running(pid_file):
            ctx = daemon.DaemonContext(
                stdout=main_log,
                stderr=main_log,
                pidfile=PIDLockFile(pid_file, threaded=False),
                working_directory=settings.ROOT,
            )
            ctx.open()
            settings.daemon = options.daemon
            options.log_to_file = True
            options.log_file_prefix = settings.tornado_log_prefix % options.port
            parse_command_line(['--log_file_prefix',options.log_file_prefix])


    start()

if __name__ == "__main__":
    main()
