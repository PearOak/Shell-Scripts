#!/bin/bash

CONT=0
#SERIE_PI=$[ $[ $[ -1 ] ** $CONT ] / $[ $[ 2*$CONT ] + 1 ] ]
PI_INT=0
echo "Digite qual o grau de precisão desejado:"
read PREC

while [[ $CONT -lt $PREC ]];do
	echo "Teste nº ${CONT}:"
	SERIE_PI="((-1)^${CONT})/((2 * ${CONT})+1)"
	PI_INT="${PI_INT} + ${SERIE_PI}"
	printf "%.80f\n" $(echo "${PI_INT}" | bc -l)
	CONT=$[ $CONT + 1 ]

done

PI="4 * (${PI_INT})"
printf "%.80f\n" $(echo "${PI}" | bc -l)
#echo $PI | bc -l
