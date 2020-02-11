class StatsMixin(object):
    _request_count = 0
    @classmethod
    def get_request_count(self):
        if isinstance(self,StatsMixin):
            return self.__class__._request_count
        else:
            return self._request_count

    @classmethod
    def increase_request_count(self):
        if isinstance(self,StatsMixin):
            self.__class__._request_count = self.__class__._request_count + 1
        else:
            self._request_count = self._request_count + 1



if __name__ == '__main__':
    class A(StatsMixin):
        pass

    ai = A()
    ai.increase_request_count()
    print(ai.get_request_count())
    A.increase_request_count()
    print(A.get_request_count())
