#!/bin/bash
echo "done" >> /root/katacoda-finished
useradd -m -d /home/ubuntu -G sudo -p $(openssl passwd -1 password) ubuntu && cd /home/ubuntu 
sudo chmod 666 /var/run/docker.sock 
cd /home/ubuntu && su ubuntu 
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 
sudo install minikube-linux-amd64 /usr/local/bin/minikube 
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" 
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl 
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add - 
sudo apt-get install apt-transport-https --yes  
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list 
sudo apt-get update 
sudo apt-get install helm
echo "done" >> /root/katacoda-background-finished