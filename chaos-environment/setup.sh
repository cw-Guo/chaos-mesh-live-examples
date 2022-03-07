#!/bin/bash
useradd -m -d /home/ubuntu -G sudo -p $(openssl passwd -1 password) ubuntu && cd /home/ubuntu > /dev/null
sudo chmod 666 /var/run/docker.sock > /dev/null
cd /home/ubuntu && su ubuntu > /dev/null
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 > /dev/null
sudo install minikube-linux-amd64 /usr/local/bin/minikube > /dev/null
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" > /dev/null
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl > /dev/null
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add - > /dev/null
sudo apt-get install apt-transport-https --yes > /dev/null
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install helm
minikube start