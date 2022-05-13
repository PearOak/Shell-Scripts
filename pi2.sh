#!/bin/bash

CONT=0
#SERIE_PI=$[ $[ $[ -1 ] ** $CONT ] / $[ $[ 2*$CONT ] + 1 ] ]
PI_INT=0

while [[ $CONT -le 10000 ]];do
	echo "Teste nº ${CONT}:"
	SERIE_PI="(4 * (-1)^${CONT})/((2 * ${CONT})+1)"
	PI_INT="${PI_INT} + ${SERIE_PI}"
	printf "%.80f\n" $(echo "${PI_INT}" | bc -l)
	CONT=$[ $CONT + 1 ]

done

PI="${PI_INT}"
printf "%.80f\n" $(echo "${PI}" | bc -l)
#echo $PI | bc -l
