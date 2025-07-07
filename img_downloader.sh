#!/bin/bash

t=$(wc -l imageurl.csv)
cat <<m 
-----------Pic One option-----------
====================================
To download all image            : 1
To download specific image       : 2
To download some range of image  : 3
====================================
m
success=0
fail=0
echo " "
read -p "Enter Your Option :" ch

case $ch in
	1)
		while read -r line; do
		wget -P /home/parthi/Downloads/task_image "$line" &>> d.log
		if [ $? -eq 0 ]
                then
                        echo "Downloaded"
			((success++))
                else
                        echo "Wrong Url"
			((fail++))
                fi 
		done < imageurl.csv
		echo -e "\nTotal Downloaded Image :$success        Total broken url :$fail \n"
		echo "====| Images are saved in this location : /home/parthi/Downloads/task_image |===="	
		;;
	2)
		read -p "Enter the specific image number (1 to $t)  :" spec
		Sline=$( head -n "$spec" imageurl.csv | tail -n 1 )
		wget -P /home/parthi/Downloads/task_image "$Sline" &>> d.log
                if [ $? -eq 0 ]
                then
			echo "====| Image is saved in this location : /home/parthi/Downloads/task_image |===="
		else
                        echo "Something happen, image not donwloaded - check the url and internet"
                fi
		;;
	3)
		echo "Enter the range"
		read -p "Start :" start
		read -p "end  :" end
		for range in $(seq "$start" "$end");
		do
		  Rline=$(head -n "$range" imageurl.csv | tail -n 1 )
		  wget -P /home/parthi/Downloads/task_image "$Rline" &>> d.log
		if [ $? -eq 0 ]
                then
			((success++))
                        echo "no - $range: image downloaded"
                else
                        echo "no - $range: image not downloaded"
			((fail++))
                fi
		done
		echo -e "\nTotal Downloaded Image :$success        Total broken url :$fail \n"
                echo "====| Images are saved in this location : /home/parthi/Downloads/task_image |===="
		;;
	*)
        echo "Invalid option"
        ;;
esac
