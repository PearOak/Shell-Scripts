#!/bin/bash

echo "Digite o número limite!"
read NUMERO
CONJUNTO=()
INDICE=0
CONT2=1
source "${HOME}/Desktop/Misc/Shell Scripts/primo(2).sh"

while [[ $CONT2 -le $NUMERO ]]; do
	Primo
	if [[ $DIV -eq 2 ]]; then
		CONJUNTO[$INDICE]=$CONT2
		INDICE=$[ $INDICE + 1 ]
	fi
	CONT2=$[ $CONT2 + 1 ]
done

echo -e "Tamanho da array: ${#CONJUNTO[@]}\nValores: ${CONJUNTO[*]}"
