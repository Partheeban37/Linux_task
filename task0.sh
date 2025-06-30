#!/bin/bash

cat <<m 
-----------Pic One option-----------
====================================
To download all image            : 1
To download specific image       : 2
To download some range of image  : 3
====================================
m
read ch

case $ch in
	1) 
		while read -r line; do
		wget -P /home/parthi/Downloads/task_image "$line"
		done < imageurl.csv
		if [$? -eq 0]
		then
			echo "********Images are save in this location : /home/parthi/Downloads/task_image*********"
		fi	
		;;
	2)
		read -p "Enter the specific image number (1 to 11)  :" spec
		Sline=$(head -n "$spec" imageurl.csv | tail -n 1 )
		wget -P /home/parthi/Downloads/task_image "$Sline"
        if [$? -eq 0]   
        then    
            echo "********Images are save in this location : /home/parthi/Downloads/task_image*********"
        fi
		;;
	3)
		echo "Enter the range"
		read -p "Start" start
		read -p "end" end
		for range in $(seq "$start" "$end");
		do
		  Rline=$(head -n "$range" imageurl.csv | tail -n 1 )
		  wget -P /home/parthi/Downloads/task_image "$Rline"
		done
        if [$? -eq 0]   
        then    
            echo "********Images are save in this location : /home/parthi/Downloads/task_image*********"
        fi
		;;
	*)
        	echo "Invalid option"
        	;;
esac
