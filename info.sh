#!/bin/bash
echo "Hostname: $(hostname)"
echo "Uptime: $(uptime -p)"
echo "Users Logged In:"
who
echo "Memory Usage:"
free -h
echo "Disk Usage:"
df -h /
