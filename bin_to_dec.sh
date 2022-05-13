#!/bin/bash

echo -e "Insira um número na base binária:"
read NUMERO

ARRAY_NUMERO=($(echo $NUMERO | grep -io [0-9]))
INDICE_ARRAY=$[ ${#ARRAY_NUMERO[@]} - 1 ]
TAMANHO_ARRAY=$INDICE_ARRAY
CONT=0
RESULT=0

while [[ $CONT -le $TAMANHO_ARRAY ]]; do
	DECIMAL=$[ ${ARRAY_NUMERO[$CONT]} * $[ 2 ** $INDICE_ARRAY ]]
	RESULT=$[ $RESULT + $DECIMAL ]
	CONT=$[ $CONT + 1 ]
	INDICE_ARRAY=$[ $INDICE_ARRAY - 1 ]
done

echo "${NUMERO} em decimal é ${RESULT}"
