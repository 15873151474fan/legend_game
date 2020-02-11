#!/bin/bash
#设置svn忽略列表脚本,每次更新.svnignore文件后请执行这个脚本

for ignorefile in `find -iname .svnignore -exec echo \{\} \;`
	do rm -v $ignorefile
done

