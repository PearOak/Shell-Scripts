#!/bin/bash

	read um
	read sinal
	read dois

	if [ "$sinal" = "+" ]; then
		result=$(($um + $dois))
		echo "$um $sinal $dois = $result"

	elif [ "$sinal" = "-" ]; then
		result=$(($um - $dois))
		echo "$um $sinal $dois = $result"

	elif [ "$sinal" = "*" ]; then
		result=$(($um * $dois))
		echo "$um $sinal $dois = $result"

	elif [ "$sinal" = "/" ]; then
		result=$(($um / $dois))
		echo "$um $sinal $dois = $result"

	elif [ "$sinal" = "^" ]; then
		result=$(($um ** $dois))
		echo "$um $sinal $dois = $result"

	else
		echo "Operação Inválida!"

	fi
