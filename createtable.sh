#!/bin/bash
echo enter your table name 
read table_name 
ls > file1
table=`grep -w "$table_name" file1`
echo $table
if [ -z "$table" ]
then
	touch $table_name
	echo enter your table primary Key first
	read pk
	if [ -z $pk  ]
	then	
		echo must id right
		rm $table_name
		exit
	else
		echo -n "$pk:" >> $table_name
	fi
	echo enter your primary Key datatype 
	read pk
	if [ "$pk" = "string" -o "$pk" = "int" ]
	then
		echo -n "$pk:" >> $table_name
	else
		echo datatype error must int or string 
		rm $table_name
		exit
	fi
	while true
	do
		echo enter the column
		read col
		if [ -z $col  ]
		then	
			echo "" >> $table_name
			break
		fi
		echo -n "$col:" >> $table_name
		echo enter dataype int or string
		read col
		if [ "$col" = "string" -o "$col" = "int" ]
		then
			echo -n "$col:" >> $table_name
		else
			echo datatype error must int or string 
			rm $table_name
			break
		fi
		
	done

	
else
	echo table "$able_name" already exist	
fi
rm file1

