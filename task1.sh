#!/bin/bash

cmdin=$1
cat <<m
----select any option----
=========================
view                  : 1
kill                  : 2
stop                  : 3
continue              : 4
search similar ps     : 5
List All processes!!  : 6
=========================
m
read -p "Enter your option  : " ch

case $ch in
	1)
		pid=$(pidof $1)
		ps -p "$pid" -f
		;;
	2)
		pkill "$1"
		if [ $? -eq 0 ] 
		then
		   echo -e "\n$cmdin was killed"
		else 
		   echo -e "\nenter correct process name"
		fi
		;;	
	3)
		echo " "
		pkill -19 "$1"
		if [ $? -eq 0 ]
		then
		   echo -e "\n$cmdin was stopped"
		else 
		   echo -e "\nenter correct process name"
		fi
		;;
	4)
		pkill -18 "$1"
		if [ $? -eq 0 ]
		then
		   echo -e "\nDone"
		else 
		   echo -e "\nenter correct process name"
		fi
		;;
	5)
		echo -e "\n======|          Result          |====="
                ps aux | grep -i "$1"
                ;;

	6)
		ps aux
		;;
	*)
		echo -e "\nAre you blind..!  just Enter one number (1 to 6)"
		;;
esac
