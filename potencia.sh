#!/bin/bash

echo "Digite a base"
read BASE
echo "Digite o expoente"
read EXPOENTE

RESULT=1
CONT=1
while [[ $CONT -le $EXPOENTE ]]; do
	RESULT=$(( $RESULT * $BASE ))
	CONT=$(( $CONT + 1 ))
done

echo $RESULT
