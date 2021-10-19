git clone https://github.com/puneetsingh166/Tm-load-testing.git
cd Tm-load-testing/customclient/my-cosmos-tester
go build
sudo cp my-cosmos-tester /usr/bin/my-cosmos-tester
my-cosmos-tester --help
sleep 30
curl http://137.184.201.190:26657

sudo bash master-slave-test1.sh
cat logs.txt
sudo bash master-slave-test2.sh
cat logsTest2.txt
sudo bash master-slave-test3.sh
cat logstest3.txt
