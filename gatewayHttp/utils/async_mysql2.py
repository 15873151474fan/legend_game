import threading
from utils.mysql import Mysql
from utils.async_mixin2 import executor_async_class

@executor_async_class(max_workers = None)
class AsyncMysql2(object):
    __async_methods__ = ['query_hash','select','insert','update','count']
    def __init__(self,db_config, **kwargs):
        super(AsyncMysql2,self).__init__()
        self._database_config = db_config
        self._thread_local_map = dict()
        self._mysql_client_count = 0

    def get_mysql_client(self):
        ct = threading.current_thread().ident
        local = self._thread_local_map.get(ct, None)
        if not local:
            local = threading.local()
            self._thread_local_map[ct] = local
            local.mysql = Mysql(self._database_config)
            self._mysql_client_count = self._mysql_client_count + 1
        return local.mysql

    def query_hash(self, sql):
        return self.get_mysql_client().query_hash(sql)

    def select(self, sql):
        return self.get_mysql_client().select(sql)

    def insert(self, sql):
        return self.get_mysql_client().insert(sql)

    def update(self, sql):
        return self.get_mysql_client().update(sql)

    def count(self, sql):
        return self.get_mysql_client().count(sql)

    def stop(self):
        pass


if __name__ == "__main__":
    import settings
    import tornado.ioloop
    import tornado.gen

    a = AsyncMysql2(settings.database_configs['development'])
    @tornado.gen.coroutine
    def do_select():
        r = yield a.query_hash('select * from apps')
        print("len: %s" % len(r))

    try:
        print "main thread id:%s" % (repr(threading.current_thread().ident))
        for i in xrange(1,100):
            print("begin %s" % i )
            do_select()
            print("end %s" % i )
        tornado.ioloop.IOLoop.instance().start()
    except KeyboardInterrupt:
        print(a._mysql_client_count)
        tornado.ioloop.IOLoop.instance().stop()
