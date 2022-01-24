#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install python-minimal
sudo apt-get -y install awscli
sudo apt-get -y install unzip
sudo aws s3 cp s3://s3-python-web-app-hello-world/http-server.py /home/ubuntu
sudo python /home/ubuntu/http-server.py &
