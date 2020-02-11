#!/usr/bin/env python

import os
import sys
import glob
import shutil
import argparse
import subprocess
import commands
import platform


cwd = os.path.dirname(os.path.abspath(__file__))

def docmd(cmd):
    print(cmd)
    #os.system(cmd)
    assert(os.system(cmd) == 0)

def docker_build(t,name,image):
    if name=="" or name == None:
        name=commands.getoutput("pwd |awk -F '/' '{print $NF}'")
    if image=="" or image == None:
        image="tdht"
    cmd = ("cp Dockerfile.%s Dockerfile")%(t)
    docmd(cmd)
    #cmd = ("cp Makefile.am.%s Makefile.am")%(t)
    #docmd(cmd)
    #cmd = ("cp configure.ac.%s configure.ac")%(t)
    #docmd(cmd)
    cmd = ("cp -Rv %s/.ssh .")%(os.getenv("HOME"))
    docmd(cmd)
    cmd = ("cp -fv %s/.gitconfig .gitconfig")%(os.getenv("HOME"))
    docmd(cmd)
    cmd = ('echo "ADD .ssh/id_rsa /root/.ssh/" >> Dockerfile')
    docmd(cmd)
    cmd = ('echo "ADD .ssh/id_rsa.pub /root/.ssh/" >> Dockerfile')
    docmd(cmd)
    cmd = ('echo "ADD .ssh/known_hosts /root/.ssh/" >> Dockerfile')
    docmd(cmd)
    cmd = ('echo "ADD .gitconfig /root/.gitconfig" >> Dockerfile')
    docmd(cmd)
    #cmd = ('echo "ADD .hosts /root/.hosts" >> Dockerfile')
    #docmd(cmd)
    #cmd = ('echo "RUN cat /root/.hosts >> /etc/hosts" >> Dockerfile')
    #docmd(cmd)
    #cmd = ('echo "ADD sql/init-zone-20150806.sql init-zone-20150806.sql" >> Dockerfile')
    #docmd(cmd)
    #cmd = ('echo "ENTRYPOINT cd %s" >> Dockerfile')%(os.getcwd())
    #docmd(cmd)
    #cmd = ('echo "ENTRYPOINT cd %s" >> Dockerfile')%(os.getcwd())
    #docmd(cmd)
    #cmd = ('echo "RUN mysqld_safe &" >> Dockerfile')
    #docmd(cmd)
    #cmd = ('echo "RUN mysql < init-zone-20150806.sql" >> Dockerfile')
    #docmd(cmd)
    cmd = ('echo "WORKDIR %s" >> Dockerfile')%(os.getcwd())
    docmd(cmd)
    #cmd = ('echo "RUN make tags" >> Dockerfile')
    #docmd(cmd)


    cmd = ("docker build -t %s_%s .")%(t,image)
    docmd(cmd)

def docker_run(t,name,image):
    if name=="" or name == None:
        name=commands.getoutput("pwd |awk -F '/' '{print $NF}'")
    if image=="" or image == None:
        image="tdht"
    #cmd = ("docker run -it --rm --hostname=docker-`hostname`-`whoami` -v %s:%s --name %s_%s %s_%s:latest /bin/bash")%(os.path.abspath(".."),os.path.abspath(".."),t,name,t,name)
    #cmd = ("docker run -it --rm --hostname=docker-`hostname`-`whoami` -v %s:%s -v %s:%s --name %s_%s %s_%s:latest /bin/bash")%(os.getenv("HOME"),os.getenv("HOME"),os.path.abspath(".."),os.path.abspath(".."),t,name,t,name)
    cmd = ("docker ps -a --filter 'name=%s_%s' --format '{{.Status}}'")%(t,name)
    print cmd
    state = os.popen(cmd,'r').read().split(" ")[0].strip()
    curRootDir = os.getcwd().split("/")
    curRootDir = curRootDir[0] + "/" + curRootDir[1]
    if state == "Up":
        cmd = ("docker exec -ti %s_%s bash -c 'ulimit -c unlimited -s 262140 -n 65535;/bin/bash;'")%(t,name)
    elif state == "Exited" or state == "Created":
        cmd = ("docker start %s_%s")%(t,name)
        docmd(cmd)
        cmd = ("docker exec -ti  %s_%s bash -c 'ulimit -c unlimited -s 262140 -n 65535;/bin/bash;'")%(t,name)
    elif platform.system().lower() == "darwin":
        cmd = ("docker run -w %s --cap-add=sys_ptrace -it --hostname=docker-`hostname`-`whoami` -h %s_%s -v /etc/localtime:/etc/localtime:ro -v %s:%s --name %s_%s %s_%s:latest bash -c 'ulimit -c unlimited -s 262140 ;/bin/bash;'")%(os.getcwd(),t,name,os.getenv("HOME"),os.getenv("HOME"),t,name,t,image)
    else:
        cmd = ("docker run -w %s --cap-add=sys_ptrace -it --hostname=docker-`hostname`-`whoami` -h %s_%s -v /etc/localtime:/etc/localtime:ro -v %s:%s -v %s:%s --name %s_%s %s_%s:latest bash -c 'ulimit -c unlimited -s 262140 ;/bin/bash;'")%(os.getcwd(),t,name,os.getenv("HOME"),os.getenv("HOME"),curRootDir,curRootDir,t,name,t,image)
    docmd(cmd)



prog = os.path.basename(os.path.abspath(__file__))
parser = argparse.ArgumentParser(prog="./%s" % prog)
#parser.add_argument("-g", "--game", action="store_true", dest="game", help="for gameserver session,scene,record,super.")
#parser.add_argument("-p", "--plat", action="store_true", dest="plat", help="for platserver monitor,login,bill,gm.")
parser.add_argument("-b", "--build", action="store_true", dest="build", help="docker build -t .")
parser.add_argument("-r", "--run", action="store_true", dest="run", help="docker run .")
parser.add_argument("-n", "--name", dest="name", help="docker build name")
parser.add_argument("-i", "--image", dest="image", help="docker build image")
#parser.add_argument("-r", "--run", dest="replace", nargs=3, metavar="", help="execute replace for go source code")
opts = parser.parse_args()

if opts.build:
    docker_build("game",opts.name,opts.image)
else:
    docker_run("game",opts.name,opts.image)
