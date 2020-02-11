#!/bin/sh

##启动所有服务脚本
##停止所有服务  ./run stop
##停止所有服务  ./run kill
##开始所有服务 ./run start
##重启所有服务 ./run reboot
## 无参数重启所有服务 ./run


dowork()
{

	OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
	export LD_LIBRARY_PATH="libs/"
	echo $LD_LIBRARY_PATH
	$PWD/SuperServer/SuperServer -d
	sleep 1
	echo "starting RecordServer/RecordServer"
	$PWD/RecordServer/RecordServer -d
	echo "starting SessionServer/SessionServer"
	$PWD/SessionServer/SessionServer -d
	#sleep 1
	echo "starting ScenesServer/ScenesServer"
	$PWD/ScenesServer/ScenesServer -d
	#sleep 3
	#echo "starting ScenesServer/ScenesServer"
	#$PWD/ScenesServer/ScenesServer -d
	#sleep 2
	#echo "starting GatewayServer/GatewayServer"
	#$PWD/GatewayServer/GatewayServer  -d
	ps x|grep "Server -d"
	export LD_LIBRARY_PATH=$OLD_LD_LIBRARY_PATH
	#sh $PWD/log.sh
}


stopwork()
{
	#pkill SuperServer -u `whoami`
	ps x |grep $PWD/SuperServer/SuperServer | grep "?" | gawk '{print $1}' | xargs kill -9
	#ps x |grep $PWD/GatewayServer/GatewayServer | grep "?" | gawk '{print $1}' | xargs kill -9
	echo "stop SuperServer/SuperServer"
	TN=0
	while test -f run.sh
	do
		COUNT=`ps x|grep $PWD|grep "Server -d"|sed -e '/grep/d'|sed -e'/NameServer/d'|sed -e'/GMServer/d' \
		| sed -e'/GuildServer/d'|sed -e '/ChatServer/d'|sed -e'/MonitorServer/d'|sed -e'/LoginServer/d' |wc -l`
		echo "running server:"$COUNT
		if [ $COUNT -eq $TN ]
		then
			break
		fi
		sleep 1
	done
}
killall()
{
	ps x |grep $PWD/SuperServer/SuperServer | gawk '{print $1}' | kill -9
	
	#pkill -9 SuperServer -u `whoami`
	echo "kill SuperServer/SuperServer"
	ps x |grep $PWD/RecordServer/RecordServer | gawk '{print $1}' | kill -9
	#pkill -9 RecordServer -u `whoami`
	echo "kill RecordServer/RecordServer"
	ps x |grep $PWD/SessionServer/SessionServer | gawk '{print $1}' | kill -9
	#pkill -9 SessionServer -u `whoami`
	echo "kill SessionServer/SessionServer"
	ps x |grep $PWD/ScenesServer/ScenesServer | gawk '{print $1}' | kill -9
	#pkill -9 ScenesServer -u `whoami`
	echo "kill ScenesServer/ScenesServer"
	ps x |grep $PWD/GatewayServer/GatewayServer | gawk '{print $1}' | kill -9
	#pkill -9 GatewayServer -u `whoami`
	echo "kill GatewayServer/GatewayServer"
}
rebootscene()
{
	OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
	export LD_LIBRARY_PATH="libs/"
	pkill ScenesServer -u `whoami`
    echo  "stop ScenesServer/ScenesServer"
	sleep 1
	./ScenesServer/ScenesServer	-d
	export LD_LIBRARY_PATH=$OLD_LD_LIBRARY_PATH
}
echo "--------------------------------------------------"
echo "--------------------START-------------------------"
echo "--------------------------------------------------"
#pkill -9 watch.sh -u `whoami`
#nohup ./watch.sh &
case $1 in
	stop)
	stopwork
	;;

	start)
	dowork
	;;

	reboot)
	stopwork
	sleep 1
	dowork
	;;

	kill)
	killall
	;;

	scene)
	rebootscene
	;;

	*)
	stopwork
	sleep 1
	dowork
	;;
esac
echo "--------------------------------------------------"
echo "----------------------DONE------------------------"
echo "--------------------------------------------------"


