#!/bin/bash

CONT=0
TAM=10
SEMENTE=""

while [[ $CONT -lt $TAM ]]; do
	NUMESCOLHIDO=$(seq 0 9 | shuf -n 1)
	SEMENTE="${SEMENTE}${NUMESCOLHIDO}"
	CONT=$[ $CONT + 1 ]
done

echo $SEMENTE
