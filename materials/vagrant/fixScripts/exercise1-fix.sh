#!/bin/bash

# Find the IP of the web page
# nslookup www.textfiles.com

# Find the route in the route table
# ip route show

# Delete the route of the web page
sudo ip route del 208.86.224.90 dev enp0s8

# Run the working command
curl http://www.textfiles.com/art/bnbascii.txt
