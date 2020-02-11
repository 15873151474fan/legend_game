#encoding: utf-8

from utils.log_mixin import LogMixin
from utils.cache import CacheMixin
from utils.mysql import construct_select_sql

class NotifyUrl(LogMixin, CacheMixin):
    _mysql = None
    _instance = None

    logBaseDir = "notify_url"
    _cache_prefix = logBaseDir
    _notify_urls = dict()


    def __new__(klass, *args, **kwargs):
        if klass._instance is None:
            klass._instance = super( NotifyUrl, klass).__new__(klass, *args, **kwargs)
        return klass._instance

    @classmethod
    def instance(self):
        if self._instance is None:
            NotifyUrl()
        return self._instance

    @classmethod
    def set_database_connection(self,connection):
        self._mysql = connection

    def find_by_my_order_id( self,  my_order_id, callback ):
        query_cond = [ "my_order_id = {0}", my_order_id ]
        table_name = "creating_orders"
        fields = "ext, url"
        sql = construct_select_sql("select %s from %s inner join notify_urls on %s.notify_url_id = notify_urls.id " % (fields, table_name, table_name), query_cond)
        def on_found(result, ex):
            if ex:
                pass
            else:
                self.set(my_order_id, result[0])
            callback(result[0],ex)
        self._mysql.query_hash( sql, callback=on_found)

if __name__ == "__main__":

    import tornado.ioloop
    import settings
    from utils.async_mysql import AsyncMysql

    mysql = AsyncMysql(settings.database_config)
    qu = NotifyUrl(mysql=mysql)

    def callback(result,ex):
        if ex:
            print(ex)
        else:
            if len(result) == 1:
                print(result[0])

    my_order_id = '123'
    qu.find_by_my_order_id(my_order_id, callback)

    try:
        tornado.ioloop.IOLoop.instance().start()
    except KeyboardInterrupt:
        mysql.stop()
