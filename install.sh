#!/bin/bash

# Install nodejs
sudo apt-get update
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
. ~/.nvm/nvm.sh
nvm install 6.11.5
sudo apt-get install -y npm

# Copy image server
cd ~
echo -n "Enter your bitbucket username : ";
read BB;
git clone https://github.com/satyashani/s3imageserve.git imageserve
cd imageserve

#Install dependencies
sudo npm install
#Copy service file
if [ -d "/etc/systemd/system/" ]; then
    cd systemctl
    sudo chmod +x runNode.sh
    sudo chmod +x nodeAppExit.sh
    sudo cp ./nodes3imageserve.service /etc/systemd/system/
    export HOME=~
    sudo sed -i.bak "s@ExecStart=~@ExecStart=$HOME@g" /etc/systemd/system/nodes3imageserve.service
    sudo sed -i.bak "s@ExecStop=~@ExecStop=$HOME@g" /etc/systemd/system/nodes3imageserve.service
    #Start service
    sudo systemctl start nodes3imageserve.service
    sudo systemctl daemon-reload
else
    sudo npm install forever -g
    forever app.js
fi

