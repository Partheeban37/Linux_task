#!/bin/bash

a_time=$1
a_date=$2

trigger_alarm() {
    notify-send "Alarm!" "It's time!"
    mpg123 ~/Music/Krishna.mp3 >/dev/null 2>&1
}


if [ -z "$a_date" ];
then
	a_date=$(date +%F)
fi

alarm="$a_date $a_time"

user_time=$(date -d "$alarm" +%s 2>/dev/null)
if [ -z "$user_time" ]; thena
    echo "Invalid date/time format..!  correct formant is:  ./alarm.sh HH:MM YYYY-MM-DD"
    exit 1
fi

current_time=$(date +%s)

wait_time=$((user_time - current_time))

if [ "$wait_time" -le 0 ]; then
    echo "Recheck the date and time you entered"
    exit 1
fi

echo "Alarm set for $alarm..!"

(
    sleep $wait_time
    trigger_alarm
) &



