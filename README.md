# Serve images from AWS S3 using apache and nodejs script

## Requirements

* Apache must be installed 
* AWS CLI must be installed 
* AWS credentials must be configured 

## Installation

### Ubuntu

* Copy `install.sh` to home folder 
* Run `install.sh` 
* Copy apache configuration from apacheproxy.conf to your apache installation 
* Change parameters in config.json as required (port, bucket name, pre folder name, aws profile 
* Restart the service using `systemctl restart nodes3imageserve.service` or restart forever using `forever restart app.js`

### Other OS

* Download this repo 
* Install nodejs 
* Install apache 
* Copy apache configuration from apacheproxy.conf to your apache installation 
* Go to project root and install dependencies using `npm install` 
* Install forever using `npm install forever -g` 
* Change parameters in config.json as required (port, bucket name, pre folder name, aws profile 
* Start service using `forever start app.js`

