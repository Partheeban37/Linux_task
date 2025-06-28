#!/bin/bash

echo "What is your name?"
read name
echo "How old are you"
read age
echo "Hii..! $name, you are $age years old."
rich=$((($RANDOM % 15) + $age))
echo "Calculating..."
sleep 1
echo "......."
sleep 1
echo "*......"
sleep 1
echo "**....."
sleep 1
echo "***...."
sleep 1
echo "*****.."
sleep 1
echo "*******"
sleep 1
echo "$name you will become a millionar when your are $rich years old"
