#!/bin/bash

# Look for the IP of www.ascii-art.de
# nslookup www.ascii-art.de

# Check if /etc/hosts has mapped www.ascii-art.de to 127.0.0.1 and delete it
sudo sed -i "/127.0.0.1 www.ascii-art.de/d" /etc/hosts

# Run the curl command to check if you can now access the resource
curl http://www.ascii-art.de/ascii/ab/007.txt
