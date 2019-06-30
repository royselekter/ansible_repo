#! /bin/bash
set -e

ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/ansible-playbooks/install-docker.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/ansible-playbooks/k8s-common.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/ansible-playbooks/k8s-master.yml
ansible-playbook -i /home/ubuntu/ansible_repo/inventory.yml /home/ubuntu/ansible_repo/ansible-playbooks/k8s-minion.yml






