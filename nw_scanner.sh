#!/bin/bash

for ip in {1..254}; do
  ping -c 1 -W 1 192.168.1.$ip &> /dev/null && echo "192.168.1.$ip is UP"
done

