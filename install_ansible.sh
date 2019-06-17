#! /bin/bash

export DEBIAN_FRONTEND=noninteractive

yes | sudo apt-get upgrade

sleep 5 

sudo apt-get update 

sleep 10

sudo apt-add-repository ppa:ansible/ansible -y

sleep 10


#apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean

sleep 10 

sudo apt-get install ansible -y 

sleep 25

sudo sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g' /etc/ssh/ssh_config
sudo chown ubuntu /etc/ssh/ssh_config
sudo echo "UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config

# sudo service ssh restart -y

sleep 30

ssh -o stricthostkeychecking=no ubuntu@192.168.15.51 'sudo echo "UserKnownHostsFile /dev/null" >> ~/.ssh/config'
ssh -o stricthostkeychecking=no ubuntu@192.168.15.52 'sudo echo "UserKnownHostsFile /dev/null" >> ~/.ssh/config'
ssh -o stricthostkeychecking=no ubuntu@192.168.10.40 'sudo echo "UserKnownHostsFile /dev/null" >> ~/.ssh/config'

sleep 5

sudo chown -R ubuntu /home/ubuntu/.ansible

chmod 777 /home/ubuntu/ansible_repo/ymlo.sh




