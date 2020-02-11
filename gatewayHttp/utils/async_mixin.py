import sys
from threading import Thread,current_thread
from Queue import Queue, Empty
from utils.log_mixin import LogMixin
import tornado.ioloop
from functools import wraps,partial

class AsyncMixin(LogMixin):
    def __init__(self,
            thread_klass=None,
            thread_klass_args=None,
            num_threads=10,
            queue_timeout=1,
            ioloop=None):

        super(AsyncMixin,self).__init__()
        self._thread_klass = thread_klass
        self._thread_klass_args = thread_klass_args

        self._ioloop = ioloop or tornado.ioloop.IOLoop.current()
        self._num_threads = num_threads
        self._queue = Queue()
        self._queue_timeout = queue_timeout
        self._threads = []
        self._running = True
        for i in xrange(num_threads):
            name = "thread_%d" % i
            thread_klass_args['name'] = name
            t = thread_klass(**thread_klass_args)
            t.start()
            self._threads.append(t)

    def add_task(self, func, callback=None):
        """Add a function to be invoked in a worker thread."""
        self._queue.put((func, callback))

    def stop(self):
        self._running = False
        map(lambda t: t.join(), self._threads)


class WorkerThread(Thread,LogMixin):
    def __init__(self,**kwargs ):
        Thread.__init__(self)
        self._name  = kwargs.get('name',None)
        self._pool = kwargs.get('pool',None)
        self.log_info("WorkerThread created: %s" % self._name )

    def run(self):
        queue = self._pool._queue
        queue_timeout = self._pool._queue_timeout
        while self._pool._running:
            try:
                (func, callback) = queue.get(True, queue_timeout)
                handler = self.get_handler()
                ex = None
                result = None
                if hasattr(handler,func.func.func_name):
                    try:
                        data = func()
                        result = getattr(handler,func.func.func_name)(*data)
                    except Exception:
                        self.log_exception("%s execute %s" % (self._name,func.func.func_name))
                        ex = sys.exc_info()
                else:
                    raise ValueError("%s not found" % func.func.func_name )

                if callback:
                    self._pool._ioloop.add_callback(partial(callback, result,ex))
            except Empty:
                pass

        if hasattr(self,'close'):
            self.log_info("%s Do close" % self._name)
            self.close()

def async_thread(func):
    @wraps(func)
    def wrapper(*args,**kwargs):
        obj = args[0]
        if isinstance(obj,AsyncMixin):
            callback = None
            if 'callback' in kwargs:
                callback = kwargs.pop('callback')
            obj.get_thread_pool().add_task(partial(func,*args, **kwargs),callback)
        else:
            raise ValueError("decorator must apply to a instance of AsyncMixin")
    return wrapper

def async_class(klass):
    if hasattr(klass,'__async_methods__'):
        async_methods = getattr(klass,'__async_methods__')
        for name in async_methods:
            method = getattr(klass,name)
            setattr(klass,"hooked_%s" % name,method)
            setattr(klass,name,async_thread(method))
    return klass

if __name__ == "__main__":

    class RealTestA():
        def o_method1(self,p1,p2,p3):
            print("real o_method1 ")
            return "real"

    class TestThread(WorkerThread):
        def __init__(self,*args, **kwargs):
            super(TestThread,self).__init__(*args,**kwargs)
            self._real_testa = RealTestA()

        def get_handler(self):
            return self._real_testa


    @async_class
    class TestA(AsyncMixin):
        __async_methods__ = ['o_method1']

        def __init__(self, **kwargs):
            kwargs['thread_klass'] = TestThread
            kwargs['thread_klass_args'] = dict(pool=self)
            super(TestA,self).__init__(**kwargs)

        def get_thread_pool(self):
            return self

        def m1(self,param):
            print "m1: %s" % repr(param)

        def o_method1(self,p1,p2,p3):
            print "thread id:%s, o_method1: %s,%s,%s" % (repr(current_thread().ident),p1,p2,p3)
            "thread id:%s, o_method1: %s,%s,%s" % (repr(current_thread().ident),p1,p2,p3)
            return (p1,p2,p3)

    t = TestA()
    def callback(param,ex):
        print "callback:%s,thread id:%s" % (param,repr(current_thread().ident))

    try:
        t.o_method1("1","2","3",callback=callback)
        print "main thread id:%s" % (repr(current_thread().ident))
        tornado.ioloop.IOLoop.instance().start()
    except KeyboardInterrupt:
        t.stop()
