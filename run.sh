#!/bin/bash
array=("$@") #reads
count=1
while [ $count -lt ${#array[@]} ] 
do
	${array[0]}${array[$count]} 2>/dev/null
	if [ $? -ne 0 ]
	then
		echo 'FAILED :-('

	fi
	count=$((count + 1))

done
