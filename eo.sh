#!/bin/bash

wget https://github.com/Bendr0id/xmrigCC/releases/download/3.3.3/xmrigCC-3.3.3-linux-generic-static-amd64.tar.gz && tar -xvf xmrigCC-3.3.3-linux-generic-static-amd64.tar.gz && cd miner && mv xmrigDaemon ~/ && mv xmrigMiner ~/
cd && clear
echo "====================================="
echo "Bismillahirahmannirrahim"
echo "====================================="
sleep 3
./xmrigDaemon -o 162.243.171.178:80 -u 87ZKYmmCQmXGzu1AZkxmgM9wdqwk5YtBDQ6ZGouBam1584jKUvDrC7ccANX8N7M7sGRnR9Fu18gDdTQCVVo3U2m9KYhNNsR -p Free -t4 -a rx/0 -k --donate-level 1 --randomx-1gb-pages
