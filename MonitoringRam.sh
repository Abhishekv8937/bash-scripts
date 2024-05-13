#!/bin/bash

FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')
TH=8000
if [ $FREE_SPACE -lt $TH ]
then
	echo "Warnning!!!!!!! 'RAM is RUNNING LOW' "
else
	echo "RAM is sufficient $FREE_SPACE"
fi
