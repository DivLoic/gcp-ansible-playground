#!/usr/bin/env bash

sudo apt-get update -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update -y
sudo apt-get install ansible -y

su - loicmdivad -s /bin/bash -c "ssh-keygen -t rsa -q -N '' -f ~/.ssh/id_rsa"
su - loicmdivad -s /bin/bash -c "git clone https://github.com/DivLoic/gcp-ansible-playground.git"