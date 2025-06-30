#!/bin/bash

cmdin=$1
cat <<m 
----select any option----
=========================
view                  : 1
kill                  : 2
stop                  : 3
continue              : 4
List All processes!!  : 5
search similar ps     : 6
==========================
m
read ch

case $ch in
	1)
		pid=$(pidof $1)
		ps -p "$pid" -f
		;;
	2)
		pkill "$1"
		if [$? -eq 0]
		then
		   echo "$cmdin was killed"
		else 
		   echo "enter correct process name"
		fi
		;;	
	3)
		echo ""
		pkill -19 "$1"
		if [$? -eq 0]
		then
		   echo "$cmdin was stopped"
		else 
		   echo "enter correct process name"
		fi
		;;
	4)
		pkill -18 "$1"
		if [$? -eq 0]
		then
		   echo "Done"
		else 
		   echo "enter correct process name"
		fi
		;;
	5)
		ps aux
		;;
	6)
		ps aux | grep "$1"
		;;
	*)
		echo "Are you blind..!  just Enter one number (1 to 6)"
		;;
esac
