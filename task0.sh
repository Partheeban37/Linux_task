#!/bin/bash

echo "Pic One option"
echo "------------------------------------"
echo "To download all image            : 1"
echo "To download specific image       : 2"
echo "To download some range of image  : 3"
echo "------------------------------------"
echo " "
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
		echo "Enter the specific image number (1 to 11)"
		read spec
		Sline=$(head -n "$spec" imageurl.csv | tail -n 1 )
		wget -P /home/parthi/Downloads/task_image "$Sline"
                if [$? -eq 0]   
                then    
                        echo "********Images are save in this location : /home/parthi/Downloads/task_image*********"
                fi
		;;
	3)
		echo "Enter the range"
		echo "Start"
		read start
		echo "end"
		read end
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
