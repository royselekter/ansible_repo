#! /bin/bash

sudo apt-add-repository ppa:ansible/ansible -y
sleep 10

#sudo apt-get update -qq && sudo apt-get dist-upgrade -qq && echo "All up to date now!" && notify-send "All up to date now!"


#apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean

sleep 10 

apt-get update
apt-get --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
apt-get --yes --force-yes -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade

sudo apt-get install ansible -y && apt-get upgrade -y




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




