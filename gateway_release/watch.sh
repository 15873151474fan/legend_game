#!/bin/sh

#状态检查间隔 
SLEEP_TIME=1
UPDATE_FILE=".update"
REBOOT_FILE=".reboot"

main()
{	
	while test -f run.sh 
	do
		if test -f $UPDATE_FILE 
		then
			svn up
			make -j10
			rm -rf $UPDATE_FILE
		fi
		if test -f $REBOOT_FILE
		then
			./run.sh
			rm -rf $REBOOT_FILE
		fi
		sleep $SLEEP_TIME 
	done
}
main
