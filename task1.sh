#!/bin/bash

cmdin=$1
echo "----select any option----"
echo "-------------------------"
echo "view specific         : 1"
echo "kill                  : 2"
echo "stop                  : 3"
echo "continue              : 4"
echo "All processes!!       : 5"
echo "search similar        : 6"
echo "-------------------------"
read ch

case $ch in
	1)
		pid=$(pidof $1)
		ps -p "$pid" -f
		;;
	2)
		pkill "$1"
		;;
	3)
		pkill -19 "$1"
		;;
	4)
		pkill -18 "$1"
		;;
	5)
		ps aux
		;;
	6)
		ps aux | grep "$1"
		;;
	*)
		echo "are you blind..!  just Enter one number (1 to 6)"
		;;
esac
