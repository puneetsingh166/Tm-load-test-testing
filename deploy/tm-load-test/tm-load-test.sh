IP=$1
# echo "---------------------------------------------------------git checkout------------------------------------------------------------------------------------------------------"

# git clone  https://github.com/puneetsingh166/tm-load-test.git
# cd tm-load-test/customclient/my-cosmos-tester
# echo "---------------------------------------------------------creating tm-load-test binary---------------------------------------------------------------------------------------"
# go build
echo "---------------------------------------------------------Set my-cosmos-tester as enviroment variable----------------------------------------------------------------------------"
sudo wget https://github.com/puneetsingh166/tm-load-test/blob/master/customclient/my-cosmos-tester/my-cosmos-tester
sudo cp my-cosmos-tester /usr/bin/my-cosmos-tester
my-cosmos-tester --help
sleep 20
echo "---------------------------------------------------------Access Port 26657 of running chain----------------------------------------------------------------------------------"

curl http://$IP:26657
echo "---------------------------------------------------------Run Master-slave client test case 1 with  -c 1 -T 20 -r 1000 -s 250----------------------------------------------------------------------------"


sudo bash master-slave-test1.sh $IP

echo "---------------------------------------------------------Run Master-slave client test case 2 with   -c 1 -T 15 -r 200 -s 2500----------------------------------------------------------------------------"


sudo bash master-slave-test2.sh $IP
echo "---------------------------------------------------------Run Master-slave client test case 3 with   -c 1 -T 10 -r 10 -s 310----------------------------------------------------------------------------"

sudo bash master-slave-test3.sh $IP

echo "---------------------------------------------------------Display Master-slave client test case 1's logs with  -c 1 -T 20 -r 1000 -s 250----------------------------------------------------------------------------"
cat logs.txt
echo "---------------------------------------------------------Display Master-slave client test case 2's logs with -c 1 -T 15 -r 200 -s 2500----------------------------------------------------------------------------"
cat logsTest2.txt
echo "---------------------------------------------------------Display Master-slave client test case 3's logs  with   -c 1 -T 10 -r 10 -s 310----------------------------------------------------------------------------"
cat logstest3.txt
