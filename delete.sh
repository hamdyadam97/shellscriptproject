#!/bin/bash
echo enter your table name
read table
ls > file1
table_name=`grep -w "$table" file1`
if [ -z "$table_name" ]
then
	echo table "$table" not here
	
else 
	echo enter your search key 
	read key
	cat $table
	echo -------------------------
	sed -i "/^$key/d" $table 
	cat $table
fi
rm file1

