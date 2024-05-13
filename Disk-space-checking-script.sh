#!/bin/bash/
DISK_SPACE=$(df -TH | grep "/dev/sdb" | awk '{print $6}' | sed 's/%//')
TO=deepaksahu7201@gmail.com
THRESHOLD=70


if [ $DISK_SPACE -ge $THRESHOLD ] 
then
	echo "WARNING DISK SPACE IS RUNNING LOW" | mail -s "DISK SPACE ALERT!" $TO
else
	echo "DISK IS FREE FOR NOW" > /home/deepak/nginx/space.log
fi
