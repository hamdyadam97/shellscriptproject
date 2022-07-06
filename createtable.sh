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
	echo -n "$pk:" >> $table_name

	echo enter your primary Key datatype 
	read pk
	echo -n "$pk:" >> $table_name
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
		echo -n "$col:" >> $table_name
	done

	
else
	echo table "$able_name" already exist	
fi
rm file1

