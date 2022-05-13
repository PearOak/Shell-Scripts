#!/bin/bash

CONT=0
CONT_REV=255
while [[ $CONT_REV -ge 0 ]]; do
	tput setab $CONT_REV
	while [[ $CONT -le 255 ]]; do
		tput setaf $CONT
		echo "Teste(${CONT})"
		CONT=$[ $CONT + 1 ]
		break
	done
	CONT_REV=$[ $CONT_REV - 1 ]
done
