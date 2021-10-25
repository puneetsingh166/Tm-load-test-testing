#!/bin/bash
set -eux

Connections=$1
Time=$2
Rate=$3
Size=$4
Filename=$5

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
result=$( docker images -q cosmoschain )

sudo bash buid-container.sh	
# Remove existing container instance
set +e
docker rm -f cosmos_test_instance
set -e

pushd $DIR/../


# Run new test container instance
docker run -d --name cosmos_test_instance -v "$(pwd)"/target:/root/logs -p 9090:9090 -p 26657:26657 -p 1317:1317 -p 8545:8545 -it cosmoschain /bin/bash -c "sleep infinity | bash /root/home/master-validator/init.sh | bash /root/home/run-load-test/master-slave.sh $Connections $Time $Rate $Size $Filename"
sleep 30
echo "------------------------------------------------Access port-----------------------------"
curl http://0.0.0.0:26657
