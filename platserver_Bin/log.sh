#!/bin/sh

#日志监视脚本
#监视gatewayserver ./log.sh ga
#监视所有日志 ./log.sh

PARA=$1
CONFIG="config.xml"
main()
{
	GATEWAYLOG=`grep gatewayserver.log $CONFIG |sed -e 's/<[a-zA-Z]*>//'|sed -e 's/<\/[a-zA-Z]*>//'`
	LOGINSERVER=`grep loginserver.log $CONFIG  |sed -e 's/<[a-zA-Z]*>//'|sed -e 's/<\/[a-zA-Z]*>//'`
	NAMESERVER=`grep nameserver.log $CONFIG  |sed -e 's/<[a-zA-Z]*>//'|sed -e 's/<\/[a-zA-Z]*>//'`
	ALL=$GATEWAYLOG" "$LOGINSERVER" "$NAMESERVER" "

	clear
	case $PARA in
		ga)
		tail --follow=name --retry $GATEWAYLOG --max-unchanged-stats=3 -n 40 -q | awk '/INFO/ {print "\033[32m" $0 "\033[39m"} /DEBUG/ {print  $0 }  /WARNING/ {print "\033[33m" $0 "\033[39m"} /TRACE/ {print "\033[33m" $0 "\033[39m"} /ERROR/ {print "\033[31m" $0 "\033[39m"} '
		;;
		*)
		tail --follow=name --retry $ALL --max-unchanged-stats=3 -n 40 -q | awk '/INFO/ {print "\033[32m" $0 "\033[39m"} /DEBUG/ {print  $0 }  /WARNING/ {print "\033[33m" $0 "\033[39m"} /TRACE/ {print "\033[33m" $0 "\033[39m"} /ERROR/ {print "\033[31m" $0 "\033[39m"}'
		;;
	esac
}
main
