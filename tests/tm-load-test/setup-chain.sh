#!/bin/bash
sudo bash buid-container.sh
# set -eux

# the directory of this script, useful for allowing this script
# to be run with any PWD
# DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Remove existing container instance
set +e
docker rm -f cosmos_container
set -e


# pushd $DIR/../

# Run new test container instance
# docker run --name cosmos_container --mount type=bind,source="$(pwd)"/,target=/onomy --cap-add=NET_ADMIN -p 9090:9090 -p 26657:26657 -p 1317:1317 -p 8545:8545 -it onomy-base /bin/bash /onomy/tests/gravity/container-scripts/reload-code.sh $NODES
docker run --name cosmos_container -d -p 26656:26656 -p 26657:26657 -p 1317:1317 -p 9090:9090  -it cosmos-chain /bin/bash -c "sleep infinity | bash /root/home/master-validator/init.sh"
sudo bash /run-load-test/master-slave-test.sh 1 20 1000 250
