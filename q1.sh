 #!/bin/bash
echo Calculator:
prog=1
re='^[0-9]+$'
while (( $prog == 1 )) 
do
	echo Please insert a number: 
	read num1
	if [ "$num1" == ":q" ]; then
		break
	fi
	while ! [[ $num1 =~ $re ]]
	do
		echo Error! Please insert a number: 
		read num1
		if [ "$num1" == ":q" ]; then
			break
		fi
	done

	while (( $prog==1 ))
	do
		echo Please insert an operation: 
		read op
		if [ "$op" == ":q" ]; then
			break 2
		fi
		while ! [[ "$op" == "+" || "$op" == "-" || "$op" == "/" || "$op" == "*" ]]
		do
			echo Error! Please insert an operation: 
			read op
			if [ "$op" == ":q" ]; then
				echo Thanks for using my calculator
				break 2
			fi
		done
		echo Please insert a number:
		read num2
		if [ "$num2" == ":q" ]; then
			break 2
		fi
		while ! [[ $num2 =~ $re ]]
		do
			echo Error! Please insert a number:
			read num2
			if [ "$num2" == ":q" ]; then
				break 3
			fi
		done
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
echo Thanks for using my calculator
