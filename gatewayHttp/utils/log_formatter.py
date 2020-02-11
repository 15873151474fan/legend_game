import tornado.log
class MyLogFormatter(tornado.log.LogFormatter):
    def get_prefix(self,record):
        return  '[%(levelname)1.1s %(asctime)s %(name)s %(module)s:%(lineno)d]' % record.__dict__
