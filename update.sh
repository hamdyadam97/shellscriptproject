#!/bin/bash
shopt -s extglob
row=""
echo enter your table name
read table
ls > file1
table_name=`grep -w "$table" file1`
pwd
echo $table_name
if [ -z "$table_name" ]
then
	echo table "$table" not here
	
else 
cat $table
echo enter your search key 
read key
id=`grep "$n" < $table | cut -s -d':' -f1 | grep -w "$n"`
if [ "$key" = "$id" ]
then
	head -1 $table > table
	sed -i "/^$key/d" $table 
	IFS=:$'\n' read -d '' -r -a arr < table
	for (( i=0; i<${#arr[@]}; i++ ))
	do
	echo enter data "${arr[$i]}"
	read n
	if [ $i = 0 ]
	then
		echo primary key
		id=`grep "$n" < $table | cut -s -d':' -f1 | grep -w "$n"`
		if [ $n = "$id" ]
			then
			echo "${arr[$i]}" is already exist
			break
		fi
	fi
	i=$i+1
	str=${arr[$i]}
	if [ $str = 'string' ]
	then	
		
		case $n in
		+([0-9]))
		row=''
		echo you enter error data
		break
		;;
		+([A-Za-z0-9]))
		row+="$n:"
		;;
		*)
		echo you enter error data
		break
		;;
		esac
	fi
	if [ $str = 'int' ]
	then		
		case $n in
		+([0-9]))
		row+="$n:"
		;;
		*)
		echo you enter error data
		break
		;;
		esac
	fi
	done
	rm table
else echo erro id
fi
if [ "$row" != '' ]
then
echo change
echo $row >> $table 
fi
fi



rm file1


