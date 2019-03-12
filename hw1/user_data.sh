#!/bin/bash

echo "Installing EPEL repo..."
sudo yum install -y epel-release

echo "Installing NGINX"
sudo yum install -y nginx

echo "Starting nginx..."
sudo service nginx start

echo "Enabling nginx..."
sudo chkconfig nginx on

echo "Done."