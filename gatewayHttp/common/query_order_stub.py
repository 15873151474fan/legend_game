#encoding:utf-8
""" default query_order """

import command
import constant
from utils.log_mixin import LogMixin
from utils.http_mixin import HttpMixin
from common.order_mixin import OrderMixin
from utils.gateway_mixin import GatewayMixin


class QueryOrderStub(GatewayMixin, HttpMixin, LogMixin, OrderMixin):
    """ QueryOrderStub """
    
    keys = []
    logBaseDir = 'QueryOrderStub'

    def __init__(self, gateway, **kwargs):
        '''initial base info'''
        super(QueryOrderStub, self).__init__(gateway)
        self._app = kwargs['app']
        self._mysql = kwargs['mysql']
        self._platform_info = kwargs['platform_info']

    def query_order(self, packet):
        '''do nothing by default'''
        return None
        
    def process(self, request_handler, params):
        '''http request handler'''
        return None

    def get_params_keys(self):
        '''return the keys for get arguments'''
        return QueryOrderStub.keys

    def check_sign(self,*args):
        '''check sign'''
        return  True

if __name__ == "__main__":
    pass
