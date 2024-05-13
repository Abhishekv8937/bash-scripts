#!/bin/bash/
#Varibles
BASE=/home/deepak/test-logging
DAYS=10	
DEPTH=1
RUN=0
#check if the directory is present or not

if [ ! -d $BASE ]
then
	echo "directory does not exist: $BASE"
	exit 1
fi

#check if the archive directory is present or not if it isn't then create one 

if [ ! -d $BASE/archive ]
then	
	mkdir $BASE/archive
fi

# now check the file that are big in size (more than 20) and create it's archive and move it to the archive directory

for i in `find $BASE -maxdepth $DEPTH -type f -size +20M`
do
	if [ $RUN -eq 0 ]
	then 
		echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
		gzip $i || exit 1
		mv $i.gz $BASE/archive || exit 1

	fi

done
