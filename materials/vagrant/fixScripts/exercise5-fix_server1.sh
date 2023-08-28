#!/bin/bash


# Add entry to hosts file
echo '192.168.60.10 server1 server1' | sudo tee -a /etc/hosts

# Setup SSH for vagrant user
mkdir -p /home/vagrant/.ssh && chmod 700 /home/vagrant/.ssh
chown vagrant:vagrant /home/vagrant/.ssh
su vagrant -c "ssh-keygen -t rsa -P '' -f /home/vagrant/.ssh/id_rsa"

# Save the public key
mkdir -p /vagrant/files/ssh
cp /home/vagrant/.ssh/id_rsa.pub /vagrant/files/ssh/$(hostname).pub

# Trust local servers
ssh-keyscan -t rsa server1 server2 | sudo tee -a /etc/ssh/ssh_known_hosts

# Combine sleep and append public keys into a single step
sleep 20
cat /vagrant/files/ssh/{server1,server2}.pub >> /home/vagrant/.ssh/authorized_keys

