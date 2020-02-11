import socket
from urlparse import urlparse,ParseResult
from tornado.httpclient import AsyncHTTPClient,HTTPRequest
from tornado.curl_httpclient import CurlAsyncHTTPClient
from tornado.netutil import BlockingResolver
class CachingResolver(object):
    _enabled = True
    _hostname_mapping = {}

    @classmethod
    def by_url(self,url):
        uri = urlparse( url )
        return self.get(uri.hostname, uri.port or 80 )

    @classmethod
    def get(self,hostname,port):
        ret = self._hostname_mapping.get((hostname, port ),None)
        if self._enabled and not ret:
            ret = self.resolve(hostname,port)
        return ret

    @classmethod
    def resolve(self,hostname,port):
        future = BlockingResolver().resolve(hostname, port, family=socket.AF_INET)
        pairs = future.result()
        if len(pairs) > 0:
            self._hostname_mapping[(hostname, port)] = pairs[0][1]
            return pairs[0][1]
        else:
            raise NameError("%s:%s" % ( hostname, port ))

    @classmethod
    def pre_resolve_urls(self,urls):
        for url in urls:
            self.by_url(url)




class DnMixin(AsyncHTTPClient):
    def pre_resolve_request(self,request):
        uri = urlparse( request.url )
        ip, port  = CachingResolver.get(uri.hostname, uri.port or 80)
        if uri.scheme == "https": port = 443
        request.headers["Host"] = uri.hostname
        pr = ParseResult(
            uri.scheme, "%s:%s" % ( ip, port) ,
            uri.path, uri.params, uri.query, uri.fragment )
        request.url = pr.geturl()
        return request

    def fetch(self, request, callback=None, **kwargs):
        if not isinstance(request, HTTPRequest):
            request = HTTPRequest(url=request, **kwargs)
        self.pre_resolve_request(request)
        super(DnMixin,self).fetch(request,callback,**kwargs)

class CurlAsyncHTTPClientEx( DnMixin,CurlAsyncHTTPClient):
    pass

if "__main__" == __name__:

    import tornado.ioloop
    import functools
    import external_urls
    AsyncHTTPClient.configure("utils.caching_resolver.CurlAsyncHTTPClientEx")
    def test_dn_mixin():
        def callback(user_data,res):
            print "==================================================="
            print res.body
            print res.request_time
            print res.code
            print res.error

        import time
        start = time.time()
        CachingResolver.pre_resolve_urls(external_urls.urls)
        print "pre resolve done, %s elapsed" % str(time.time() - start)
        client  = AsyncHTTPClient()
        url = "http://www.google.com"
        for url in external_urls.urls:
            request = HTTPRequest(url,connect_timeout=5,validate_cert=False)
            client.fetch(request,functools.partial(callback,None))
        tornado.ioloop.IOLoop.instance().start()

    def test_dn_cache():
        for url in external_urls.urls:
            print CachingResolver.by_url(url)
    def print_mapping():
        test_dn_cache()
        for k,v in CachingResolver._hostname_mapping.items():
            print "%s %s" % ( v[0],k[0])
    #test_dn_mixin()
    #test_dn_cache()
    print_mapping()
