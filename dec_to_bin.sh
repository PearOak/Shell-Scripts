#!/bin/bash

echo -e "Manda um número decimal ai:"
read NUMERO
INDICE=0
BINARIO=()
STRING_BIN=""
BIN_FINAL=""

while [[ $NUMERO -ge 1 ]]; do

	if [[ $NUMERO -eq 2 ]]; then
		BINARIO[$INDICE]=$(($NUMERO % 2))
		BINARIO[$(($INDICE + 1))]=$(($NUMERO / 2))
		RESULTADO=$(($NUMERO / 2))
		NUMERO=$RESULTADO
		INDICE=$(($INDICE + 1))
	else
		BINARIO[$INDICE]=$(($NUMERO % 2))
		RESULTADO=$(($NUMERO / 2))
		NUMERO=$RESULTADO
		INDICE=$(($INDICE + 1))
	fi
done

CONT=$((${#BINARIO[@]} - 1))

while [[ $CONT -ge 0 ]]; do
	STRING_BIN="${BINARIO[$CONT]}"
	BIN_FINAL="${BIN_FINAL}${STRING_BIN}"
	CONT=$(($CONT - 1))
done
echo "${BIN_FINAL}"
