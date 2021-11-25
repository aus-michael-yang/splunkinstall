#!/bin/sh

 WGET_CMD="wget -O splunk-8.2.3-cd0848707637-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/8.2.3/linux/splunk-8.2.3-cd0848707637-Linux-x86_64.tgz"
 
 INSTALL_FILE="splunk-*"
 PASSWORD="ExpertInsight"


 cd /opt
 sudo yum install wget
 sudo $WGET_CMD
 sudo tar -xvzf $INSTALL_FILE
 sudo rm -rf $INSTALL_FILE

 sudo useradd -m -r archStudent

 sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd $PASSWORD
 sudo /opt/splunk/bin/splunk stop -auth admin:$PASSWORD
 sudo chown -R archStudent:archStudent /opt/splunk
 sudo -u archStudent /opt/splunk/bin/splunk restart
 sudo /opt/splunk/bin/splunk enable boot-start -user archStudent
