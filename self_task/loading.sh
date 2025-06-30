echo -n "Loading"
for i in {1..10}
do
    for x in '-' '\' '|' '/'
    do
        echo -ne "\rLoading $x"
        sleep 0.1
    done
done
echo -e "\rDone!     "
