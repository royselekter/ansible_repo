#! /bin/bash

sudo apt-get update 

sleep 10

sudo apt-add-repository -y ppa:ansible/ansible

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y ansible

sudo apt-get install ansible -y 

sleep 25

sudo sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo chown ubuntu /etc/ssh/ssh_config
sudo echo "UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config

# sudo service ssh restart -y

sleep 30

ssh -o stricthostkeychecking=no ubuntu@192.168.10.51 'sudo echo "UserKnownHostsFile /dev/null" >> ~/.ssh/config'
ssh -o stricthostkeychecking=no ubuntu@192.168.10.52 'sudo echo "UserKnownHostsFile /dev/null" >> ~/.ssh/config'
ssh -o stricthostkeychecking=no ubuntu@192.168.10.40 'sudo echo "UserKnownHostsFile /dev/null" >> ~/.ssh/config'

sleep 5

sudo chown -R ubuntu /home/ubuntu/.ansible






