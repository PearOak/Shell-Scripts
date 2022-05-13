#!/bin/bash

contagem=50

while [ $contagem -ge 0 ]; do
	if [[ $(($contagem % 2)) -eq 1 ]]; then
		echo "$contagem"
	fi
	contagem=$(($contagem - 1))
done

echo "BOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOM!!!!!!"
