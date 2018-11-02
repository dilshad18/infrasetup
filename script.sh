#!/bin/bash
sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get update && sudo add-apt-repository ppa:webupd8team/java -y
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt install  software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt update && sudo apt install openjdk-8-jdk ansible jenkins -y
sudo service jenkins start

