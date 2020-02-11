from utils.mysql import Mysql
from utils.async_mixin import AsyncMixin,async_class,WorkerThread

class MysqlThread(WorkerThread):
    def __init__(self,*args, **kwargs):
        self._mysql = Mysql(kwargs['db_config'])
        super(MysqlThread,self).__init__(*args,**kwargs)
        self.daemon = True

    def get_handler(self):
        return self._mysql

    def close(self):
        self._mysql.close()

@async_class
class AsyncMysql(AsyncMixin):
    __async_methods__ = ['query_hash','select','insert','update','count']
    def __init__(self,db_config, **kwargs):
        kwargs['thread_klass'] = MysqlThread
        kwargs['thread_klass_args'] = dict(pool=self,db_config=db_config)
        super(AsyncMysql,self).__init__(**kwargs)

    def get_thread_pool(self):
        return self

    def query_hash(self,sql):
        self.log_debug("query_hash:(%s)" % (sql))
        return (sql,)

    def select(self,sql,how=1):
        self.log_debug("select:(%s)" % (sql))
        return (sql,)

    def insert(self,sql):
        self.log_debug("insert:(%s)" % (sql))
        return (sql,)

    def update(self,sql):
        self.log_debug("update:(%s)" % (sql))
        return (sql, )

    def count(self,sql,field):
        self.log_debug("count:(%s)" % (sql))
        return (sql, field)

    def close(self):
        self.stop()

if __name__ == "__main__":
    def test():
        import tornado

        DATABASE = dict(
            charset = 'utf8',
            database= 'zqgate_development',
            username= 'zqgate',
            password= 'zqgate123',
            host= '10.18.234.209'
        )
        am = AsyncMysql(DATABASE,num_threads=20)

        def print_id(row_id,ex):
            print row_id

        def print_generator(gen,ex):
            for data in gen:
                print data

        def print_data(data_set,ex):
            print repr(data_set)

        try:
            for i in xrange(1000):
                am.insert("insert into test_table(app_key,product_id,amount)VALUES('xxxx%(num)s','yyyyy%(num)s',10.0*%(num)s)" % dict(num=1),callback=print_id)
                am.query_hash("select * from schema_migrations",callback=print_data)
            #am.select("select * from schema_migrations",callback=print_generator)
            tornado.ioloop.IOLoop.instance().start()
        except KeyboardInterrupt:
            am.stop()
