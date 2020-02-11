import tornado.ioloop
from tornado.concurrent import run_on_executor
from concurrent.futures import ThreadPoolExecutor
import multiprocessing

class _ExecutorAsyncClass(object):
    def __init__(self, klass, max_workers=None):
        self._klass = klass
        self._max_workers = max_workers or multiprocessing.cpu_count()

    def __call__(self, *args ):
        if hasattr(self._klass,'__async_methods__'):
            async_methods = getattr(self._klass,'__async_methods__')
            if not hasattr(self._klass,'executor'):
                setattr(self._klass,'executor', ThreadPoolExecutor(self._max_workers))

            @property
            def _io_loop():
                return tornado.ioloop.IOLoop.current()

            if not hasattr(self._klass,'io_loop'):
                setattr(self._klass,'io_loop', _io_loop)

            for name in async_methods:
                method = getattr(self._klass,name)
                setattr(self._klass,name,run_on_executor(method))
        return self._klass


def executor_async_class(klass=None, max_workers=None):
    if klass:
        return _ExecutorAsyncClass(klass, None)()
    else:
        def wrapper(klass):
            return _ExecutorAsyncClass(klass, max_workers)()
        return wrapper
