#!/bin/bash
num=$1
reg='^[1-9]+[0-9]*$'
if ! [[ $num =~ $reg ]] ; then
	echo true
	num=3
fi
echo "Your computer is going to explode in $num seconds!"
while [ $num -gt 0 ]
do
	echo $num
	sleep 1s
	num=$((num - 1))
	trap 'echo "Nooo! YOU CAN'\''T STOP THIS! :-D :-D"' 2
done
echo BOOOOM!
