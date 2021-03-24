#!/usr/bin/env bash

# Bootstrap script to install Ansible and Git so that the 
# main BMON install Ansible playbook can be run.

# First get necessary packages with the package manager
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible git nano

# Move to the home directory and clone the BMON install repo,
# make a .bmon directory to hold variables and other info related
# to the install, and start a variables file in the directory.
cd ~
rm -rf bmon-install
git clone https://github.com/alanmitchell/bmon-install.git
mkdir .bmon || true
chmod 700 .bmon
cp bmon-install/variables-example.yaml .bmon/variables.yaml

echo
echo
echo "Edit the 'variables.yaml' file in the .bmon directory,"
echo "for example:"
echo 
echo "    nano ~/.bmon/variables.yaml"
echo
echo "Then, run the BMON installation script:"
echo
echo "    ~/bmon-install/install.sh"
echo
echo " If asked for a 'BECOME password', use your sudo password."
echo