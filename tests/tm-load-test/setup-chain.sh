!/bin/bash
sudo bash buid-container.sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $DIR/../

# Run new test container instance
docker run -d --name cosmos_test_instance -p 9090:9090 -p 26657:26657 -p 1317:1317 -p 8545:8545 -it cosmoschain /bin/bash -c "sleep infinity | bash /root/home/master-validator/init.sh | bash /root/home/run-load-test/master-slave.sh 1 25 200 2500 logs"
sleep 30
echo "------------------------------------------------Access port-----------------------------"
curl http://0.0.0.0:26657
