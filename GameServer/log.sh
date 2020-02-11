#!/bin/sh

#日志监视脚本
#监视superserver ./log.sh su
#监视recordserver ./log.sh re
#监视sessionserver ./log.sh se
#监视sceneserver ./log.sh sc
#监视gm指令 ./log.sh gm 这个先预留
#监视所有日志 ./log.sh

PARA=$1
CONFIG="config.xml"
main()
{
	SUPERLOG=`grep superserver.log $CONFIG |sed -e 's/<[a-zA-Z]*>//'|sed -e 's/<\/[a-zA-Z]*>//'|sed -e 's/\r//'`
	RECORDLOG=`grep recordserver.log $CONFIG |sed -e 's/<[a-zA-Z]*>//'|sed -e 's/<\/[a-zA-Z]*>//'|sed -e 's/\r//'`
	SESSIONLOG=`grep sessionserver.log $CONFIG |sed -e 's/<[a-zA-Z]*>//'|sed -e 's/<\/[a-zA-Z]*>//'|sed -e 's/\r//'`
	SCENELOG=`grep sceneserver.log $CONFIG |sed -e 's/<[a-zA-Z]*>//'|sed -e 's/<\/[a-zA-Z]*>//'|sed -e 's/\r//'`
	GMLOG=`grep gmcommandlogfilename.log $CONFIG |sed -e 's/<[a-zA-Z]*>//'|sed -e 's/<\/[a-zA-Z]*>//'|sed -e 's/\r//'`
	ALL=$SUPERLOG" "$SESSIONLOG" "$SCENELOG" "$RECORDLOG" "

	clear
	case $PARA in
		su)
		tail --follow=name --retry $SUPERLOG --max-unchanged-stats=3 -n 40 -q | awk '/INFO/ {print "\033[32m" $0 "\033[39m"} /DEBUG/ {print  $0 }  /WARNING/ {print "\033[33m" $0 "\033[39m"} /TRACE/ {print "\033[33m" $0 "\033[39m"} /ERROR/ {print "\033[31m" $0 "\033[39m"} '
		;;
		se)
		tail --follow=name --retry $SESSIONLOG  --max-unchanged-stats=3 -n 40 -q | awk '/INFO/ {print "\033[32m" $0 "\033[39m"} /DEBUG/ {print  $0 }  /WARNING/ {print "\033[33m" $0 "\033[39m"} /TRACE/ {print "\033[33m" $0 "\033[39m"} /ERROR/ {print "\033[31m" $0 "\033[39m"} '
		;;
		sc)
		tail --follow=name --retry $SCENELOG  --max-unchanged-stats=3 -n 40 -q | awk '/INFO/ {print "\033[32m" $0 "\033[39m"} /DEBUG/ {print  $0 }  /WARNING/ {print "\033[33m" $0 "\033[39m"} /TRACE/ {print "\033[33m" $0 "\033[39m"} /ERROR/ {print "\033[31m" $0 "\033[39m"} '
		;;
		re)
		tail --follow=name --retry $RECORDLOG --max-unchanged-stats=3 -n 40 -q | awk '/INFO/ {print "\033[32m" $0 "\033[39m"} /DEBUG/ {print  $0 }  /WARNING/ {print "\033[33m" $0 "\033[39m"} /TRACE/ {print "\033[33m" $0 "\033[39m"} /ERROR/ {print "\033[31m" $0 "\033[39m"} '
		;;
		gm)
		#tail --follow=name --retry $GMLOG --max-unchanged-stats=3 -n 40 | awk '/INFO/ {print "\033[32m" $0 "\033[39m"} /DEBUG/ {print  $0 }  /WARNING/ {print "\033[33m" $0 "\033[39m"} /TRACE/ {print "\033[33m" $0 "\033[39m"} /ERROR/ {print "\033[31m" $0 "\033[39m"} '
		;;
		*)
		#tail --follow=name --retry $ALL --max-unchanged-stats=3 -n 5 -q |grep "109[^0-9]"
		#tail --follow=name --retry $ALL --max-unchanged-stats=3 -n 5 -q |grep -v "的连接失败"
		tail --follow=name --retry $ALL --max-unchanged-stats=3 -n 5 -q | awk '/INFO/ {print "\033[32m" $0 "\033[39m"} /DEBUG/ {print  $0 }  /WARNING/ {print "\033[33m" $0 "\033[39m"} /TRACE/ {print "\033[33m" $0 "\033[39m"} /ERROR/ {print "\033[31m" $0 "\033[39m"}'
		;;
	esac
}
main
