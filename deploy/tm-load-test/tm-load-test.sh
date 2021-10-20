git clone https://github.com/puneetsingh166/Tm-load-testing.git
cd Tm-load-testing/customclient/my-cosmos-tester
go build
sudo cp my-cosmos-tester /usr/bin/my-cosmos-tester
my-cosmos-tester --help
sleep 20
curl http://137.184.201.190:26657
echo "Run Master-slave client test case 1 with  -c 1 -T 20 -r 1000 -s 250"
sudo bash master-slave-test1.sh
echo "Display Master-slave client test case 1's logs.."
cat logs.txt
echo "Run Master-slave client test case 2 with   -c 1 -T 15 -r 200 -s 2500"
sudo bash master-slave-test2.sh
echo "Display Master-slave client test case 2's logs.."
cat logsTest2.txt
echo "Run Master-slave client test case 3 with   -c 1 -T 10 -r 10 -s 310"
sudo bash master-slave-test3.sh
echo "Display Master-slave client test case 3's logs."
cat logstest3.txt
