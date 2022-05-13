#!/bin/bash

echo "Please, input number of days your account is active:"
read AGE
echo "Please, input multiplier:"
read MULTI

WINNING=$[ $MULTI * $[ $[ 2 * $AGE ] + 50 ] ]

echo "You'll win ${WINNING} NPs! :)"
