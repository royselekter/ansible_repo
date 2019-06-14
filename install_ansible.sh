#! /bin/bash

sudo apt-add-repository ppa:ansible/ansible -y
sleep 10

sudo apt-get update -y
sleep 10 

sudo apt-get -y install debconf-utils

sudo echo 'libssl1.0.0:amd64 libssl1.0.0/restart-services string' | sudo debconf-set-selections

apt-get install libpq-dev,

sudo debconf-get-selections | grep libssl1.0.0:amd64

sudo apt-get install ansible -y

sleep 60

sudo sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo chown ubuntu /etc/ssh/ssh_config
sudo echo "UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config

sudo service ssh restart

sleep 30

ssh -o stricthostkeychecking=no ubuntu@192.168.15.51 'sudo echo "UserKnownHostsFile /dev/null" >> ~/.ssh/config'
ssh -o stricthostkeychecking=no ubuntu@192.168.15.52 'sudo echo "UserKnownHostsFile /dev/null" >> ~/.ssh/config'
ssh -o stricthostkeychecking=no ubuntu@192.168.10.40 'sudo echo "UserKnownHostsFile /dev/null" >> ~/.ssh/config'

sleep 5

sudo chown -R ubuntu /home/ubuntu/.ansible

chmod 777 /home/ubuntu/ansible_repo/ymlo.sh




