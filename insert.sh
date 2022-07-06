#!/bin/bash
shopt -s extglob
typeset -i x
row=''
echo enter tablename
read table
ls > file1
inserttable=`grep -w "$table" file1`
if [ -z "$inserttable" ]
then
	echo table "$table" not here
	
else 
		echo like this plz
		head -1 $table > table
		cat ./table
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
				echo primarykey is already exist
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
			row=''
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
			row=''
			break
			;;
			esac
		fi
		done
		if [ "$row" != '' ]
			then
			echo change
			echo $row >> $table 
		fi
		rm table
fi
rm file1
