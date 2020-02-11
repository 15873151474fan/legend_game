import hashlib
from utils import to_utf8

class SignMixin(object):
    def calc_sign(self,params):
        keys = sorted(filter(lambda x: x != "sign", params.keys()))
        sign_str = '&'.join([ "%s=%s" % (key,to_utf8(params.get(key,''))) for key in keys if params.get(key)])
        print("sign_str:%s" % sign_str)
        sign = hashlib.md5(sign_str+self._app['key']).hexdigest()
        return sign

if __name__ == "__main__":
    from urlparse import parse_qsl
    class SM(SignMixin):
        def __init__(self):
            super(SM, self).__init__()
            self._app = dict(key='7833e7446004a9e0177b256f2f60004b')

    session_id = '1c812bca02deab0cb0456af88af2519e'
    query= "account=679320609&app_id=102334155&distributor_id=nd&ext=&session=" + session_id
    l = parse_qsl(query)
    params = {}
    sm = SM()
    for p in l:
        params[p[0]] = p[1]

    keys = sorted(params.keys())
    sign_str = '&'.join([ "%s=%s" % (key,params.get(key,'')) for key in keys])
    key='7833e7446004a9e0177b256f2f60004b'
    a_sign = hashlib.md5(sign_str+key).hexdigest()
    sign = sm.calc_sign(params)

    print(a_sign == sign)
