#!/bin/bash
echo enter your table name
read table
ls > file1
table_name=`grep -w "$table" file1`
if [ -z "$table_name" ]
then
	echo table "$table" not here
	
else 
	cat $table
	echo enter your primary key 
	read n
	grep  -w ^"$n" < $table  
fi
rm file1




