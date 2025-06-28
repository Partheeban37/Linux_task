#!/bin/bash

beast=$(($RANDOM % 2))

echo "Enter 0 or 1, if the beast also pic the same number you will die, if not means your are saved"

read usernum

if [[ $beast == $usernum ]]; then
	echo "You are saved"
else
	echo "you are died"
fi
