#!/bin/bash

echo "Setting up Tor service..."
systemctl restart tor
sleep 1

echo "Starting NGINX localhost..."
nginx
sleep 1

echo "Starting tor..."
tor &
