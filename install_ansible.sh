#!/bin/bash 

#This script is to insatll ansible latest version
#Before ansible used to use python2 version
#Bust now ansible is using python3 version programming code so need to install python first and then install ansible
yum install python3-pip -y
pip3 install pip --upgrade
pip3 install ansible


