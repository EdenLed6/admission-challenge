#!/bin/bash
 # test2
# Add server1s hostname and IP to /etc/hosts if it doesn't exist
grep -q "server1" /etc/hosts || echo "192.168.60.10 server1 server1" | sudo tee -a /etc/hosts

# Disable strict host checking for SSH
echo -e "Host *\n\tStrictHostKeyChecking no\n\tUserKnownHostsFile /dev/null" | tee -a ~/.ssh/config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Set correct permissions for SSH config
chmod 600 ~/.ssh/config
sudo systemctl restart sshd

