#!/usr/bin/env bash

echo "Creating user 'deploy'..."
sudo adduser deploy
echo "Adding user 'deploy' to sudoers..."
sudo usermod -aG sudo deploy
echo "Copy SSH key to authorized keys for user 'deploy'..."
mkdir -p /home/deploy/.ssh
cat ./config/ssh/id_rsa.pub >> /home/deploy/.ssh/authorized_keys

echo "Hardening sshd_config..."
cp ./config/ssh/sshd_config /etc/ssh/sshd_config

echo "Restarting sshd..."
sudo systemctl restart sshd
