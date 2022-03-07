#!/bin/bash
useradd -m -d /home/ubuntu -G sudo -p $(openssl passwd -1 password) ubuntu && cd /home/ubuntu
sudo chmod 666 /var/run/docker.sock
su ubuntu