#!/bin/bash
PS3="enter the number:"
select cmd in "press 1 to create databsse" "press 2 list to database" "press 3 connect to database" " press 4 Drop database " "press 5 to exit"
do
case $REPLY in
1) 
	echo enter your database
	read n
	ls > file
	database=`grep "\<$n\>" file`
	if [ $n = "$database" ]
		then
		echo database is already exist
		
	else
		mkdir $n
		echo database is crate
		
	fi
	rm file
	continue
	;;
				
2) 
	ls -d */
	continue
	;;
3) 
	echo connect to your database
	ls > file
	read n
	database=`grep "\<$n\>" file`
	if [ $n = "$database" ]
	then		rm file 
			cd $database
			select cmd in "press 1 to create table" "press 2 list to table" "press 3 drop to table" " press 4 select " "press 5 to insert" "press 6 to update" "press 7 to dele form table" 				"press 8 to exit"
			do
			case $REPLY in
			1)	
				/home/hamdy/project/createtable.sh
				
				break 1
				;;
			2) /home/hamdy/project/listtable.sh
				break 1
				;;
			3) /home/hamdy/project/droptable.sh
				break 1
				;;
			4) /home/hamdy/project/select.sh
				break 1
				;;
			5) /home/hamdy/project/insert.sh
				break 1
				;;
			6) /home/hamdy/project/update.sh
				break 1
				;;
			7) /home/hamdy/project/delete.sh
				break 1
				;;
			8) 	exit
				;;
			*) 	echo $REPLY is not of option
			;;
			esac
			done
	else
	echo database not here
	rm file 
	fi
	break
	;;
4)	echo drop to your database
	ls > file
	read n
	database=`grep "\<$n\>" file`
	if [ $n = "$database" ]
	then
	rm -r  $database
	continue 
	else
	continue 
	fi
	rm file
	;;
5) 	exit
	;;
*) 	echo $REPLY is not of option
	;;
esac
done
