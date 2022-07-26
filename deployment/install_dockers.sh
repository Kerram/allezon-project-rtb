#!/bin/bash -v

USERNAME=$1
PASSWORD=$2

sudo apt -y install ansible sshpass

for i in `seq -w 01 10`; do sshpass -p ${PASSWORD} ssh ${USERNAME}@${USERNAME}vm1$i.rtb-lab.pl -o StrictHostKeyChecking=no -C "/bin/true"; done

sudo cp ansible_hosts /etc/ansible/hosts
cat docker_service > docker.service

ansible-playbook --extra-vars "ansible_user=${USERNAME} ansible_password=${PASSWORD}" docker-playbook.yaml

ansible docker -m ping --extra-vars "ansible_user=${USERNAME} ansible_password=${PASSWORD}"


