class CacheMixin(object):
    _cache = dict()
    @classmethod
    def set_cache_prefix(self, prefix):
        self._cache_prefix = prefix

    @classmethod
    def get_cache_prefix(self):
        return self._cache_prefix

    def get_real_key(self, key ):
        if isinstance(self,CacheMixin):
            real_key = "%s_%s" % ( self.__class__._cache_prefix, key )
        else:
            real_key = "%s_%s" % ( self._cache_prefix, key )
        return real_key

    def set(self, key, value):
        real_key = self.get_real_key(key)
        self.__class__._cache[real_key] = value
        print(self.__class__._cache)

    def get(self, key):
        real_key = self.get_real_key(key)
        return self.__class__._cache.get(real_key, None)

    def delete(self, key):
        real_key = self.get_real_key(key)
        if real_key in self.__class__._cache:
            del self.__class__._cache[real_key]

if __name__ == "__main__":
    class T1(CacheMixin):
        _cache_prefix = 't1'

    class T2(CacheMixin):
        _cache_prefix = 't2'
        pass

    print(T1.get_cache_prefix())
    print(T2.get_cache_prefix())

