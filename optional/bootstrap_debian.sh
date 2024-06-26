#!/bin/bash

# Client Tools Install

# Check if root and sudo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

# Update package repo
apt-get update

# Install Vim
apt-get install vim -y

# Install Git
apt-get install git -y

# Install bash-completion
apt-get install bash-completion -y

#Install screen
#apt-get install screen -y

#Install tmux
apt-get install tmux -y

# Install python
apt-get install python -y

# Install make if not already there
apt-get install make -y

# Download cfssl and cfssljson
wget -q --show-progress --https-only --timestamping \
https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 \
https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64

# Set execute permissions
chmod +x cfssl_linux-amd64 cfssljson_linux-amd64

# Move to /usr/local/bin/ and rename to shortname
sudo mv cfssl_linux-amd64 /usr/local/bin/cfssl
sudo mv cfssljson_linux-amd64 /usr/local/bin/cfssljson

#Verify cfssl is installed
cfssl version

# Install kubectl
#if kubectl version == "1", then;
#  wget https://storage.googleapis.com/kubernetes-release/release/v1.9.0/bin/linux/amd64/kubectl
#chmod +x kubectl
#sudo mv kubectl /usr/local/bin/

# Verify kubectl is installed:
# kubectl version --client
