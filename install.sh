#!/bin/bash

# Install nodejs
sudo apt-get update
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 6.11.5
sudo apt-get install -y npm

# Copy image server
cd ~
git clone git@github.com:satyashani/s3imageserve.git imageserve
cd imageserve

#Install dependencies
sudo npm install
#Copy service file
sudo cp ./nodes3imageserve.service /etc/systemd/system/
#Start service
sudo systemctl restart nodes3imageserve.service

