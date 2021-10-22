#!/bin/bash
sleep 35
connections=$2
time=$3
rate=$4
size=$5
fileName=$6
sleep 35
curl http://0.0.0.0:26657
echo "--------------------------------------- test cases starting-----------------------------------------------------------"
my-cosmos-tester master --expect-slaves 1 --bind localhost:26670 -c 1 -T 20 -r 10000 -s 250 --broadcast-tx-method async --endpoints ws://0.0.0.0:26657/websocket &
my-cosmos-tester slave --master ws://localhost:26670 &
destdir=./$fileName.txt
while true
do
sleep 1
data=$(curl http://localhost:26670/metrics)
VAR_LENGTH=${#data}
if (( VAR_LENGTH > 100 )); then
     echo "$data" > "$destdir"
else
    echo "check latest log in logs.txt file in your current directory"
    break
fi

done

cat $fileName.txt
echo "done"
