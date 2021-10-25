#!/bin/bash
sleep 35
connections=$1
time=$2
rate=$3
size=$4
fileName=$5
curl http://0.0.0.0:26657
echo "--------------------------------------- test cases starting-----------------------------------------------------------"
my-cosmos-tester master --expect-slaves 1 --bind localhost:26670 -c $connections -T $time -r $rate -s $size --broadcast-tx-method async --endpoints ws://0.0.0.0:26657/websocket &
my-cosmos-tester slave --master ws://localhost:26670 &
destdir=/root/logs/$fileName.txt
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
