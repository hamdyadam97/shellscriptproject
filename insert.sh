#!/bin/bash
shopt -s extglob
typeset -i x
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
		echo "${#arr[@]}"
		for (( i=0; i<${#arr[@]}; i++ ))
		do
		echo enter data "${arr[$i]}"
		read n
		if [ $i = 0 ]
		then
			echo primary key
			id=`grep "$n" < $table | cut -s -d':' -f1 | grep -w "$n"`
			echo $id
			echo $n
			if [ $n = "$id" ]
				then
				echo database is already exist
				break
			fi
		fi
		i=$i+1
		str=${arr[$i]}
		if [ $str = 'string' ]
		then	
			
			case $n in
			+([0-9]))echo digit
			;;
			+([A-Za-z0-9]))echo -n "$n:" >> $table 
			;;
			*)echo nothing
			;;
			esac
		fi
		if [ $str = 'int' ]
		then		
			case $n in
			+([0-9]))echo -n "$n:" >> $table 
			;;
			*)echo nothing
			;;
			esac
		fi
		done
		echo "" >> $table 
		rm table
fi
rm file1
