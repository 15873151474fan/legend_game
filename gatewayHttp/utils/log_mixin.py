import os
import os.path
import logging
from logging.handlers import TimedRotatingFileHandler
import settings
from tornado.util import import_object
from tornado.log import LogFormatter
from tornado.options import options
class MyLogger(logging.Logger):
    def findCaller(self):
        f = logging.currentframe()
        if f is not None:
            f = f.f_back
        rv = "(unknown file)", 0, "(unknown function)"
        while hasattr(f, "f_code"):
            co = f.f_code
            filename = os.path.normcase(co.co_filename)
            if 'log_mixin.py' in filename or filename == logging._srcfile :
                f = f.f_back
                continue
            rv = (co.co_filename, f.f_lineno, co.co_name)
            break
        return rv

class LogMixin(object):
    def _get_logger(self,level_name):
        if hasattr(self.__class__,'logger_inited'):
            log_base_name = getattr(self.__class__,'log_base_name')
            min_level = getattr(logging, options.logging.upper())
            if getattr(logging, level_name.upper()) < min_level:
                level_name = options.logging
            logger_name = '%s_%s' % (self.log_base_name,level_name)
            logger = getattr(self.__class__,logger_name)
        else:
            log_to_file = hasattr(options,'log_to_file') and options.log_to_file
            logging.setLoggerClass(MyLogger)
            if log_to_file and hasattr(self.__class__,"logBaseDir"):
                log_base_name = getattr(self.__class__,"logBaseDir")
            else:
                log_base_name = "default"
            setattr(self.__class__,'log_base_name',log_base_name)
            log_dir = os.path.abspath(os.path.join(settings.log_base_dir,log_base_name))
            if not os.path.exists(log_dir):
                os.makedirs(log_dir)
                os.chmod(log_dir, 0775)

            level_names = dict(debug=logging.DEBUG,info=logging.INFO,warning=logging.WARNING,error=logging.ERROR)
            min_level = getattr(logging, options.logging.upper())
            for n,l in level_names.items():
                if l < min_level: continue
                log_name = '%s_%s' % (log_base_name,n)
                logger = self.create_logger(log_name,l)
                if log_to_file:
                    path = os.path.join(log_dir,"%s@%s.log" % (n,options.port))
                    handler = self.create_timed_handler(l,path,
                        settings.log_rotating_when,
                        settings.log_backup_count)
                    logger.addHandler(handler)
                else:
                    logger = self.create_logger(log_name,l)
                    channel = logging.StreamHandler()
                    channel.setFormatter(LogFormatter(color=True))
                    logger.addHandler(channel)

                setattr(self.__class__,log_name,logger)

            setattr(self.__class__,'logger_inited',True)

            if getattr(logging, level_name.upper()) < min_level:
                level_name = options.logging

            logger_name = '%s_%s' % (log_base_name,level_name)
            logger = getattr(self.__class__,logger_name)

        return logger

    def create_logger(self, name,level):
        logger = logging.getLogger(name)
        logger.propagate = False
        logger.setLevel(level)
        [logger.removeHandler(h) for h in logger.handlers]
        return logger

    def create_timed_handler(self,level,file_prefix,when,backup_count):
        channel = TimedRotatingFileHandler(
                filename=file_prefix,
                when=when,
                backupCount=backup_count)
        channel.setLevel(level)
        channel.setFormatter(LogFormatter(color=False))
        return channel

    def log_debug(self,msg,*args,**kwargs):
        self._get_logger('debug').debug(msg,*args,**kwargs)

    def log_info(self,msg,*args,**kwargs):
        self._get_logger('info').info(msg,*args,**kwargs)

    def log_warning(self, msg, *args, **kwargs):
        self._get_logger('warning').warning(msg,*args,**kwargs)

    def log_error(self, msg, *args, **kwargs):
        self._get_logger('error').error(msg,*args,**kwargs)

    def log_exception(self,msg,*args,**kwargs):
        self._get_logger('error').exception(msg,*args,**kwargs)

    def get_log_file(self,level_name):
        config = import_object("config")
        log_dir = os.path.abspath(os.path.join(settings.log_base_dir,config.log_base_name))
        return os.path.join(log_dir,'%s.log' % level_name )
