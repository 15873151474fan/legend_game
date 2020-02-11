import functools
from tornado.httputil import url_concat
from tornado.httpclient import AsyncHTTPClient,HTTPRequest
from tornado.netutil import Resolver

class HttpMixin(object):

    def request_get(self, url, params, callback, user_data=None, headers=None):
        url = url_concat(url,params)
        client  = AsyncHTTPClient()
        request = HTTPRequest(url,connect_timeout=10,headers=headers)
        self.log_debug(url)
        client.fetch(request,functools.partial(callback,user_data))

    def request_post(self, url, body, callback, user_data=None, headers=None):
        client  = AsyncHTTPClient()
        if isinstance(url,HTTPRequest):
            request = url
            url = request.url
        else:
            request = HTTPRequest(url,method="POST",body=body,connect_timeout=10,headers=headers)
        self.log_debug("POST %s:%s" %( url, body))
        client.fetch(request,functools.partial(callback,user_data))

if "__main__" == __name__:
    import tornado.ioloop
    from utils.log_mixin import LogMixin
    Resolver.configure('tornado.platform.caresresolver.CaresResolver')
    AsyncHTTPClient.configure("tornado.curl_httpclient.CurlAsyncHTTPClient")
    class TestHttpMixin(HttpMixin,LogMixin):
        pass
    def callback(user_data,res):
        print res.body
        print res.error

    hm = TestHttpMixin()
    hm.request_get("http://www.google.com",{},callback)
    tornado.ioloop.IOLoop.instance().start()
