#!/bin/bash

#Iniciando o script
echo "Digite o número que se deseja descobrir o fatorial:"
read NUMERO #Lê o numero que se deseja extrair o fatorial
FAT=$NUMERO #Será apenas usado no fim
RESULT=1 #Número utilizado como resultado

while [[ $NUMERO -ge 0 ]]; do
	if [[ $NUMERO -eq 0 ]]; then
		break #Como fatorial de 0 é 1, então o looping vai ser quebrado ai
	elif [[ $NUMERO -lt 0 ]]; then
		echo "Não existe fatorial de número negativo, arrombado!" #Dispensa comentários, né? kkkk
		break
	else
		RESULT=$(( $RESULT * $NUMERO )) #Operaçao do fatorial. Result mudará de valor em cada iteração
		NUMERO=$(( $NUMERO - 1 )) #Número vai diminuir até 0
	fi
done

echo "${FAT}! = ${RESULT}"
