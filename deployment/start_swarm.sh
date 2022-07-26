#!/bin/bash -v

USERNAME=$1
PASSWORD=$2

ansible-playbook --extra-vars "ansible_user=${USERNAME} ansible_password=${PASSWORD}" swarm-playbook.yaml

