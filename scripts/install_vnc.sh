#!/bin/bash
#
# This script installs VNC

chown root:vagrant /run/user/1000
# sudo yum install tigervnc-server -y
sudo su - vagrant -c `cat "/share/scripts/input.txt" | vncserver`
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service
cat ~/.vnc/*.log
ifconfig
