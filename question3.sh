#!/bin/bash
echo "Welcome to CISC 220 Racing Area"
car1="|->"
car2="|->"
car3="|->"
car1length=${#car1}
car2length=${#car2}
car3length=${#car3}
flagwhile=0
while (( $flagwhile==0 ));
do
	read -p  "User1 press 1 to move forward, User2 press 2 to move forward, User3 press 3 to move forward" -n 1  userInput
	clear
	if [[ -n ${userInput//[0-9]/} ]]; then
		break
	elif [[ $userInput -eq 1 ]]; then
		car1="~$car1";
		car1length=$(($car1length+1));
		if [[ $car1length -ge 43 ]]; then
			flagwhile=1;
		fi
	elif [[ $userInput -eq 2 ]]; then
		car2="~$car2";
		car2length=$car2length+1;
		if [[ $car2length -ge 43 ]]; then
			flagwhile=2;
		fi
	elif [[ $userInput -eq 3 ]]; then
		car3="~$car3";
		car3length=$car3length+1;
		if [[ $car3length -ge 43 ]]; then
			flagwhile=3;
		fi
	else
	echo "You just entered an invalid input. Please try again"
	fi
echo -e
echo "$car1   # Lane 1 #"
echo "$car2   # Lane 2 #"
echo "$car3   # Lane 3 #"
done
if [[ flagwhile -eq 1 ]]; then
	echo -e "Congratulations User1. You win!!"
elif [[ flagwhile -eq 2 ]]; then
	echo -e "Congratulations User2. You win!!"
else
	echo -e "Congratulations User3. You win!!"
fi


