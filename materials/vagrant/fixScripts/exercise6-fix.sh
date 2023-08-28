#!/bin/bash

# Identify the target server based on current hostname
target_server="server1"
[ "$(hostname)" == "server1" ] && target_server="server2"

# Extract destination
destination="${!#}"

# Calculate total bytes of files and scp them
total_bytes=0
for file in "$@"; do
    if [ "$file" != "$destination" ]; then
        scp "$file" "vagrant@$target_server:$destination"
        total_bytes=$(( total_bytes + $(stat -c %s "$file") ))
    fi
done

# Print total bytes
echo $total_bytes
