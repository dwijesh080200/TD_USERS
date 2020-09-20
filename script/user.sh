#!/bin/bash

#to convert xls to csv because sh file does not recognise xls file 
xls2csv user.xls > user.csv

#stock the directory in a variable
test="~//user.csv"

#stock the users created by code in another variable
array=($(awk -F: '{ print $1 }' /etc/passwd ))

i=0

#while loop to read every line in the file
while IFS= read -r line
do


	#to verify if name in the file(csv) already has a user or not
	#if user exist then the if condition will give i a value
	#and the loop will continue to execute itself
	i=0
	for person in ${array[*]}
	do
		if [ "$line" = "\"$item\"" ]
		then
			i=$((i+1))
		fi
	done

	#if user does not exist then the if will not be executed
	#and value of i will remain 0
	#then the second if condition will be executed 
	if [ "$i" = 0 ]
	then

		#in this loop the name of the user being created will be stored  in the variable  var
		#the code in the () give the file users.csv without
		#sed | ... removes the " "

		var="$(echo $line | sed 's/\"//g')"
		
		#command to create new users
		sudo useradd $var

		#gives home directory to users
		mkhomedir_helper $var
		
	fi
done < $test
