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
	echo "starting GatewayServer"
	$PWD/GatewayServer/GatewayServer -d
}

stopwork()
{
	COUNT=`ps x|grep $PWD|grep "Server"|wc -l`
	echo "running server:"$COUNT
	killall
	TN=0
	while test -f run.sh
	do
		COUNT=`ps x|grep $PWD|grep "Server"|wc -l`
		echo "running server:"$COUNT
		if [ $COUNT -eq $TN ]
		then
			break
		fi
		sleep 1
	done
}
rungate()
{
    OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH="libs/"
	echo "starting GatewayServer"
	$PWD/GatewayServer/GatewayServer -d
}


runlogin()
{
    OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH="libs/"
	echo "starting LoginServer"
	$PWD/LoginServer/LoginServer -d
}

runname()
{
    OLD_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
    export LD_LIBRARY_PATH="libs/"
	echo "starting NameSever"
	$PWD/NameServer/NameServer -d
}

killall()
{
	ps x |grep GatewayServer | gawk '{print $1}' |xargs kill -9
	ps x |grep LoginServer | gawk '{print $1}' |xargs kill -9
	ps x |grep NameServer | gawk '{print $1}' |xargs kill -9
	#pkill -9 GatewayServer -u `whoami`
	echo "kill GatewayServer"
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

    gate)
    rungate
    ;;

    login)
    runlogin
    ;;

    name)
    runname
    ;;

	kill)
	killall
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


