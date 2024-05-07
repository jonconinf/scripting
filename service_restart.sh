#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi

service_name=$1

# Restart the service using launchctl
launchctl stop "$service_name"
launchctl start "$service_name"

# Check if the service is running
if launchctl list | grep -q "$service_name"; then
    echo "Service $service_name restarted successfully."
else
    echo "Failed to restart service $service_name."
fi
