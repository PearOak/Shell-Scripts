#!/bin/bash

function calculadora {
	if [ "$2" = "+" ]; then
		echo "$1 $2 $3 = $(($1 + $3))"

	elif [ "$2" = "-" ]; then
		echo "$1 $2 $3 = $(($1 - $3))"

	elif [ "$2" = "*" ]; then
		echo "$1 $2 $3 = $(($1 * $3))"

	elif [ "$2" = "/" ]; then
		echo "$1 $2 $3 = $(($1 / $3))"

	elif [ "$2" = "^" ]; then
		echo "$1 $2 $3 = $(($1 ** $3))"

	else
		echo "Esta operação não existe!"
	fi
}

calculadora 2 + 2
calculadora 3 - 2
calculadora 3 \* 5
calculadora 100 / 5
calculadora 2 ^ 19
calculadora 2 teste 555
