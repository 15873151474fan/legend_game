OS="`uname -s`"
if [ "$OS" = "Linux" ]; then
  sudo apt-get install build-essential
  sudo apt-get install libmysqlclient-dev build-essential python-dev libcurl4-openssl-dev swig libreadline-dev libssl-dev libzip-dev
else
  if [ -n `which brew` ]; then
    brew install homebrew/versions/swig2
  else
    cd /tmp
    svn co -r 120783 http://svn.macports.org/repository/macports/trunk/dports/devel/swig
    cd swig/
    sudo port install +swig
    curl -O http://www.mirrorservice.org/sites/packages.macports.org/swig-python/swig-python-3.0.2_0.darwin_14.x86_64.tbz2
    tar xf swig-python-3.0.2_0.darwin_14.x86_64.tbz2
    sudo cp -r opt /
  fi
fi
sudo easy_install tornado futures mysql-python pyflakes python-daemon netifaces pycares pycurl pycrypto m2crypto
