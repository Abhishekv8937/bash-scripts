#!/bin/bash
<<comment
read -p "Enter the site name or Dns you want to check connectivity with :" site

ping -c 1 $site
if [ $? -eq 0 ]
then 
	echo "connection established successfully"
else 
	echo "You have entered wrong dns or site name"
fi
comment
NO=$(($RANDOM % 6))
echo "the output is $NO"
