#!/bin/sh

#调试各条服务器进程脚本
#./xDebug se  调试SessionServer
#./xDebug sc  调试ScenesServer
#./xDebug su  调试SuperServer
#./xDebug ga  调试GatewayServer
#./xDebug re  调试RecordServer
#./xDebug ro  调试RobotServer
#./xDebug gu  调试GuildServer

PARA=$1

main()
{	
	case $PARA in	
		ga)
		PID=`ps x|grep "GatewayServer -d"|sed -e '/grep/d'|sed -e 's/ [^0-9 ].*//g'|sed -e '/^$/d'`
		;;
		se)
		PID=`ps x|grep "SessionServer -d"|sed -e '/grep/d'|sed -e 's/ [^0-9 ].*//g'|sed -e '/^$/d'`
		;;
		sc)
		PID=`ps x|grep "ScenesServer -d"|sed -e '/grep/d'|sed -e 's/ [^0-9 ].*//g'|sed -e '/^$/d'|sed -e '2d'`
		;;	
		re)
		PID=`ps x|grep "RecordServer -d"|sed -e '/grep/d'|sed -e 's/ [^0-9 ].*//g'|sed -e '/^$/d'`
		;;	
		su)	
		PID=`ps x|grep "SuperServer -d"|sed -e '/grep/d'|sed -e 's/ [^0-9 ].*//g'|sed -e '/^$/d'`
		;;
		ro)
		PID=`ps x|grep "RobotServer"|sed -e '/grep/d'|sed -e 's/ [^0-9 ].*//g'|sed -e '/^$/d'`
		;;	
		gu)
		PID=`ps x|grep "GuildServer"|sed -e '/grep/d'|sed -e 's/ [^0-9 ].*//g'|sed -e '/^$/d'`
		;;	
		*)
		#无参数默认调试GatewayServer
		#PID=`ps x|grep "GatewayServer -d"|sed -e '/grep/d'|sed -e 's/ [^0-9 ].*//g'|sed -e '/^$/d'`
		echo "找不到线程。。。"
		exit
	esac	
	if [ $PID = "" ]
	then
		echo "找不到线程。。。"
		exit
	fi
#	echo $PID
	gdb -p $PID
}
main


