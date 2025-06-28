#!/bin/bash

name=$1
compliment=$2

user=$(whoami)
where=$(pwd)
date=$(date)

echo "good morning $name!!"
sleep 1
echo "your're looking good today $name!!"
sleep 1
echo "you have the best $compliment i've seen $name!!"
sleep 1
echo "your are loged in $user and your corrently at $where also the date is : $date"
