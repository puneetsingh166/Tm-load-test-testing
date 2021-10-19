git clone https://github.com/puneetsingh166/Tm-load-testing.git
cd cosmos/customclient/my-cosmos-tester
go build
sudo cp my-cosmos-tester /usr/bin/my-cosmos-tester
my-cosmos-tester --help
sleep 30
curl http://137.184.201.190:26657
my-cosmos-tester -c 1 -T 10 -r 10 -s 250 --broadcast-tx-method async --endpoints ws://137.184.201.190:26657/websocket  --stats-output ./stats.csv
