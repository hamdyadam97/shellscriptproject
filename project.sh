#!/bin/bash
PS3="enter the number:"
select cmd in "press 1 to create databsse" "press 2 list to database" "press 3 connect to database" " press 4 Drop database"
do
case $REPLY in
1) 
	echo enter your database
	read n
	ls > file
	database=`grep @$n < file `
	echo $database
	 if test $n=$database -a -n $database
	then
		echo database is already exist
		
	else
		mkdir $n
		echo database is crate
		
	fi
	rm file
	break
	;;
				
2) 
	ls
	break
	;;
3) 
	echo connect to your database
	read database
	cd $database
	$SHELL
	break
	;;
4)	echo drop your database
	read database
	rmdir  $database
	break 
	;;
*) echo $REPLY is not of option
;;
esac
done
