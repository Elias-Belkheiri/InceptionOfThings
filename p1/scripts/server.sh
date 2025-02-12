#!/bin/bash

# Update and install required packages
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y curl

# Install K3s server
curl -sfL https://get.k3s.io | sh -

# Wait for a few seconds to ensure k3s is running
sleep 10

# Get the token and save it to a file that can be shared with agents
sudo cat /var/lib/rancher/k3s/server/node-token > /vagrant/node-token

# Setup kubeconfig
mkdir -p ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
sudo chown $USER:$USER ~/.kube/config