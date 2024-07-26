#!/bin/bash
#sec is a random number between -100 and 100
sec=$RANDOM
limit=100
#if sec doesn't fit the limit, make a new one
while [ $(($sec * $sec)) -gt $(($limit * $limit)) ]
do
    sec=$RANDOM
done
#echo $sec
echo "I'm thinking a number between -$limit and $limit."
echo "Can you guess which one?"
read guess
while [ $sec -ne $guess ]
do
    if [ $guess -lt $sec ]
    then
	echo 'go higher'
    else
	echo 'go lower'
    fi
    read guess
done
echo BINGO!
