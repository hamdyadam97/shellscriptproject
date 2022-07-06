#!/bin/bash
echo enter name table that you want drop
read table_name
ls > file1
table=`grep -w "$table_name" file1`
echo $table
if [ -z "$table" ]
then
	echo table "$table_name" not here
	
else 
	rm $table_name 
fi
rm file1

