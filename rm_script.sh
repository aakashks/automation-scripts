#!/bin/bash

# Specify the host you want to remove from known_hosts
HOST_TO_REMOVE="paramganga.iitr.ac.in"

# Path to the known_hosts file
KNOWN_HOSTS_FILE="$HOME/.ssh/known_hosts"

# Temp file to store the updated known_hosts content
TMP_FILE="/tmp/known_hosts.tmp"

# Remove the specified host from the known_hosts file
sed "/$HOST_TO_REMOVE/d" "$KNOWN_HOSTS_FILE" > "$TMP_FILE"

# Overwrite the original known_hosts file with the updated content
mv "$TMP_FILE" "$KNOWN_HOSTS_FILE"

#echo "Removed entries for $HOST_TO_REMOVE from $KNOWN_HOSTS_FILE"



#### Old host file 
# Path to the known_hosts file
KNOWN_HOSTS_FILE="$HOME/.ssh/known_hosts.old"

# Temp file to store the updated known_hosts content
TMP_FILE="/tmp/known_hosts.tmp"

# Remove the specified host from the known_hosts file
sed "/$HOST_TO_REMOVE/d" "$KNOWN_HOSTS_FILE" > "$TMP_FILE"

# Overwrite the original known_hosts file with the updated content
mv "$TMP_FILE" "$KNOWN_HOSTS_FILE"

#echo "Removed entries for $HOST_TO_REMOVE from $KNOWN_HOSTS_FILE"
