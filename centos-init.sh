#!/bin/bash

set -e

sudo yum update -y

sudo yum install -y nginx lsb-core

echo "Hello World - $(lsb_release -d | cut -f2-)" | sudo tee /usr/share/nginx/html/index.html

sudo systemctl enable nginx
sudo systemctl start nginx
