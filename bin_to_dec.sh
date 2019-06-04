#!/bin/bash

echo -e "Insira um número na base binária:"				#Print do script
read NUMERO								#Pede input do usuário

ARRAY_NUMERO=($(echo $NUMERO | grep -io [0-9]))				#Essa linha vai criar uma array que vai "quebrar" o número digitado e cada "pedaço" será um valor da matriz
INDICE_ARRAY=$[ ${#ARRAY_NUMERO[@]} - 1 ]				#Formada a array, essa linha serve para indicar qual o último índice da array
TAMANHO_ARRAY=$INDICE_ARRAY
CONT=0
RESULT=0

while [[ $CONT -le $TAMANHO_ARRAY ]]; do				#While que fará a conversão de binário para decimal
	DECIMAL=$[ ${ARRAY_NUMERO[$CONT]} * $[ 2 ** $INDICE_ARRAY ]]	#Lógica por trás da conversão em que cada valor da array será multiplicada por 2 elevado ao INDICE_ARRAY (que seria o expoente, no caso)
	RESULT=$[ $RESULT + $DECIMAL ]					#O número convertido, no qual, ao receber as instruções da linha anterior, vai se somar
	CONT=$[ $CONT + 1 ]						#Incremento que percorrerá todos os índices da array
	INDICE_ARRAY=$[ $INDICE_ARRAY - 1 ]				#Decremento referente ao expoente do número
done									#Fim do while

echo "${NUMERO} em decimal é ${RESULT}"					#Print que mostrará tanto o binário quanto o decimal
