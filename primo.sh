#!/bin/bash

echo "Please, input a number: "
read NUM

DIV=1
CONT=0

echo "\n\n-------------------- DOING THE MATH --------------------\n"
while [[ $DIV -le $NUM ]]; do
	RES=$[ $NUM / $DIV ]
	REM=$[ $NUM % $DIV ]

	if [[ $REM -eq 0 ]]; then
		echo -e "${NUM}/${DIV} = ${RES}\nRemain: ${REM}"
		CONT=$[ $CONT + 1 ]
		echo "Total dividers (so far): ${CONT}"
#	else
#		echo -e "${NUM}/${DIV} = ${RES} \n Remain: ${REM}"
#		echo "Total dividers (so far): ${CONT}"
	fi

	DIV=$[ $DIV + 1 ]
done

echo -e "\n\n------------------- CONCLUSION --------------------\n"

if [[ $CONT -eq 2 ]]; then
	echo "${NUM} is a prime number, since it is divided by only ${CONT} different numbers!"
else
	echo "${NUM} is not a prime number, sice it is divided by ${CONT} different numbers!"
fi

echo "Done! :D"
