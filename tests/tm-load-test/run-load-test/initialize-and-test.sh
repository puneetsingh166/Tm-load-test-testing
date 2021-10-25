#!/bin/bash

CONNECTIONS=$1
TIME=$2
RATE=$3
SIZE=$4
FILE_NAME=$5

bash /root/home/master-validator/init.sh
sleep 30
echo "-----------------Check chain stated or not---------------------"
curl http://0.0.0.0:26657
echo "-----------------Run the tests---------------------"
bash /root/home/run-load-test/master-slave.sh $CONNECTIONS $TIME $RATE $SIZE $FILE_NAME