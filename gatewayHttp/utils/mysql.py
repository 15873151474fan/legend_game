#encoding: utf-8

import _mysql

class Mysql(object):
    def __init__(self,args):
        super(Mysql,self).__init__()
        charset = args.get('charset','utf8')
        if 'charset' in args:
            del args['charset']
        self.charset = charset
        self._connect_args = self.adopt_connect_params(args)
        self.connect()

    def connect(self):
        self._client = _mysql.connect(**self._connect_args)
        self._client.query("SET NAMES '%s'" % self.charset)

    def close(self):
        self._client.close()

    def adopt_connect_params(self,args):
        param_mapping = {
            'password' : 'passwd',
            'database' : 'db',
            'username' : 'user'
        }
        tmp = {}
        for key in args:
            if key in param_mapping:
                tmp[param_mapping[key]] = args[key]
            else:
                tmp[key] = args[key]
        return tmp

    def client(self):
        return self._client

    def get_field_pos(self,result):
        field_pos = {}
        count = 0
        for field in result.describe():
            field_pos[field[0]] = count
            count += 1
        return field_pos

    def query(self, sql):
        try:
            self._client.ping()
        except _mysql.OperationalError:
            self.connect()
        res = None
        try:
            res = self._client.query(sql)
        except _mysql.OperationalError as ex:
            args = [ a for a in ex.args ]
            args.append(sql)
            raise _mysql.OperationalError(*args)
        return res

    def query_hash(self,sql):
        self.query(sql)
        result = self._client.use_result()
        rows = result.fetch_row(maxrows=100)
        data_set = []
        field_set = self.get_field_pos(result)
        while len(rows) > 0:
            for row in rows:
                row_set = {}
                for field in field_set:
                    row_set[field] = row[field_set[field]]
                data_set.append(row_set)
            rows = result.fetch_row(maxrows=100)
        return data_set

    def select(self,sql,how=1):
        self.query(sql)
        result = self._client.use_result()
        rows = result.fetch_row(maxrows=100,how=how)
        while len(rows) > 0:
            for row in rows:
                yield row
            rows = result.fetch_row(maxrows=100,how=how)

    def insert(self,sql):
        self.query(sql)
        return self._client.insert_id()

    def update(self,sql):
        self.query(sql)
        return self._client.affected_rows()

    def count(self,sql,field):
        return int(self.query_hash(sql)[0][field])


def construct_where_sql(where_list):
    if isinstance(where_list,list):
        l = len(where_list)
        if l== 0:
            return "1=1"
        elif l == 1:
            return where_list[0]
        else:
            cond, args = where_list.pop(0),where_list
            return cond.format(*[ format_value(a) for a in args ])
    else:
        raise ValueError(" where_tuples type is invalid")

def construct_insert_sql(table_name, a_dict):
    sql_template = "INSERT `{0}`({1}) VALUES ({2})"
    keys = ','.join(["`%s`" % k for k in a_dict.keys()])
    values = ','.join(["%s" % format_value(a_dict[k]) for k in a_dict.keys() ])
    return sql_template.format( table_name , keys, values )

def construct_upsert_sql(table_name, a_dict, on_duplicate_dict):
    sql_template = "INSERT `{0}`({1}) VALUES ({2}) ON DUPLICATE KEY UPDATE {3}"
    keys = ','.join(["`%s`" % k for k in a_dict.keys()])
    values = ','.join(["%s" % format_value(a_dict[k]) for k in a_dict.keys() ])
    on_duplicate_dict_values = ','.join(["`%s`=%s" % (k, format_value(on_duplicate_dict[k])) for k in on_duplicate_dict.keys() ])
    return sql_template.format( table_name , keys, values, on_duplicate_dict_values )

def construct_update_sql(table_name, a_dict, where):
    sql_template = "UPDATE `{0}` SET {1}"
    keys = ','.join(["`%s`=%s" % (k,format_value(v)) for k,v in a_dict.items()])
    sql = sql_template.format( table_name , keys )
    if where:
        sql = sql + " WHERE {0}".format(construct_where_sql(where))
    return sql

def construct_select_sql(select_sql,where):
    sql_template = select_sql
    if where:
        sql = sql_template + " WHERE {0}".format(construct_where_sql(where))
    return sql

class MysqlExpr(object):
    def __init__(self,s):
        super(MysqlExpr,self).__init__()
        self._function = s

    def __str__(self):
        return self._function

def is_function(s):
    funcs = ["NOW()", "ADDTIME("]
    for func in funcs:
        if func in s:
            return True

def format_value(v):
    if isinstance(v,(int,long,float)):
        return str(v)
    elif isinstance(v,unicode):
        v = v.encode("UTF-8")
        return "'%s'"  % _mysql.escape_string(v)
    elif isinstance(v,str):
        return "'%s'"  % _mysql.escape_string(v)
    elif isinstance(v,MysqlExpr):
        return v
    elif v is None:
        return ''

if __name__ == "__main__":
    print construct_where_sql(["where name = {0} and age = {1}", "myname",MysqlExpr("age + 1")])
    print construct_where_sql(["where name = {0} and age = {1}", "myname",MysqlExpr("NOW()")])
    print construct_where_sql(["where name = {0} and age = {1}", "myname",123])
    print construct_insert_sql("users",{'username': "123123'","password":"xxx'"})
    print construct_upsert_sql("users",{'username': "123123'","password":"xxx'"}, {'count': MysqlExpr('count + 1')})
    print construct_update_sql("users",{'username': "123123'","password":"xxx'"},[" username = {0} and password={1}" , "123123","34343"] )
    print construct_select_sql("select * from users",[" username = {0} and password={1}" , "12'3123","34343"] )
    import settings
    def test1():
        m = Mysql(settings.database_configs['development'])
        print m._client.ping()
        try:
            print "ping"
            print m._client.ping()
            print "query1"
            m._client.query("select now()")
        except _mysql.OperationalError,e:
            print str(e)
            m.connect()
            m._client.query("select now()")
            print "query2"
    def test2():
        m = Mysql(settings.database_configs['development'])
        print "query1"
        m.query_hash("select now()")
        m.query_hash("select now()")
        print "query2"

    test2()
