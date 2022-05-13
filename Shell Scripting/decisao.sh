#!/bin/bash

#Variáveis para brincar
numero=15
abacaxi=20
nome="Wellington"

#Condições
echo "Teste 1: "
if [ $numero -le 15 ]; then
	echo "Condição primária confirmada!"
elif [ $numero -gt 12 ]; then
	echo "Condição secundária confirmada!"
else
	echo "Deu merda ai, filhão!"
fi

echo "Teste 2: "

if [[ $(( $numero + $abacaxi )) -lt 35 || $abacaxi -le 20 ]]; then
	echo "Condição confirmada!"
else
	echo "Fudeu ai, carai!"
fi

echo "Teste 3: "

if [[ $(( $numero + $abacaxi )) -ge 35 && "$nome" == "Wellington" ]]; then
	echo "Condição OK!"
else
	echo "Vish..."
fi
