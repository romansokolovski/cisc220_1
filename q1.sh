#!/bin/bash
echo Calculator:
prog=1

while (( $prog==1 ))
do
	echo Please insert a number: 
	read num1
	if [ "$num1" == ":q" ]; then
		prog=0;
	fi
	while (( $prog==1 ))
	do
		echo Please insert an operation: 
		read op
		if [ "$op" == ":q" ]; then
			prog=0;
			break
		fi
		echo Please insert a number:
		read num2
		if [ "$num2" == ":q" ]; then
			prog=0;
			break
		fi
		if [ "$op" == "+" ]; then
			counter=`expr $num1 + $num2`;
		elif [ "$op" == "-" ]; then
			counter=`expr $num1 - $num2`;
		elif [ "$op" == "*" ]; then
			counter=`expr $num1 \* $num2`;
		elif [ "$op" == "/" ]; then
			counter=`expr $num1 / $num2`;
		else
			echo This is else;
		fi
		num1=$counter
		echo Result so far is: $counter
	done
done
