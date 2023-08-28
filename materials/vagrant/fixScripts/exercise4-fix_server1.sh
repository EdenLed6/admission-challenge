#!/bin/bash

 # testing 
# Add server2s hostname and IP to /etc/hosts if it doesn't exist
grep -q "server2" /etc/hosts || echo "192.168.60.11 server2 server2" | sudo tee -a /etc/hosts

# Disable strict host checking for SSH and make password auth 
echo -e "Host *\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile /dev/null" | tee -a ~/.ssh/config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Set correct permissions for SSH config
chmod 600 ~/.ssh/config

sudo systemctl restart sshd

