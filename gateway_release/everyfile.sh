#!/bin/sh


show()
{
	echo $file
}
#--------------------------------------------------------------------------------
company2corps()
{
	sed "s/corps/army/g" $file > $file.tmp
	#sed "s/Corps/Army/g" $file > $file.tmp
	#sed "s/CORPS/ARMY/g" $file > $file.tmp
	#sed "s/company/corps/g" $file > $file.tmp
	#sed "s/Company/Corps/g" $file > $file.tmp
	#sed "s/COMPANY/CORPS/g" $file > $file.tmp
	mv $file.tmp $file
}
#--------------------------------------------------------------------------------
dos2unix()
{
	dos2unix $file
}
#--------------------------------------------------------------------------------
clean()
{
	for file in *
	do
		if [ -d "$file" ]
		then
			if [ $file = "3Party" ]
			then
				continue
			fi
			if [ $file = "script" ]
			then
				continue
			fi
			cd $file

			rm -vrf *~
			rm -vrf *.o
			chmod 644 *.{h,cpp} 2>/dev/null

			clean
			cd ..
		fi
	done
}
#--------------------------------------------------------------------------------
func()
{
	for file in *
	do
		if [ -d "$file" ]
		then
			touch $file
			cd $file
			func
			cd ..
		else
			show
		fi
	done
}
#--------------------------------------------------------------------------------
main()
{
	func
	#clean
}
main

#find . * -print|xargs touch
