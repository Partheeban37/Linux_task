#!/bin/bash

while read -r line; do
wget -P /home/parthi/Downloads/task_image "$line"
done < imageurl.csv
