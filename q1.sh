#!/bin/bash
echo Calculator:
prog=1

while (( $prog==1 ))
do
	echo Please insert a number: 
	read num1
	echo Please insert an operation: 
	read operation
	echo Please insert a number:
	read num2
	if [[ $operation=="+" ]] ; then
	counter=`expr $num1 + $num2`
	else
	echo This is else
	fi
	echo Result so far is: $counter
	prog=1
done
