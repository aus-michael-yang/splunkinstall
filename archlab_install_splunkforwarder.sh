#!/bin/sh 
 
 WGET_CMD="wget -O splunkforwarder-8.2.3-cd0848707637-Linux-x86_64.tgz https://download.splunk.com/products/universalforwarder/releases/8.2.3/linux/splunkforwarder-8.2.3-cd0848707637-Linux-x86_64.tgz"
 INSTALL_FILE="splunkforwarder-*"
 PASSWORD="ExpertInsight"


 cd /opt
 sudo yum install wget
 sudo $WGET_CMD
 sudo tar -xvzf $INSTALL_FILE
 sudo rm -rf $INSTALL_FILE

 sudo useradd -m -r archStudent

 sudo /opt/splunkforwarder/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd $PASSWORD
 sudo /opt/splunkforwarder/bin/splunk stop -auth admin:$PASSWORD
 sudo chown -R archStudent:archStudent /opt/splunkforwarder
 sudo -u archStudent /opt/splunkforwarder/bin/splunk restart
 sudo /opt/splunkforwarder/bin/splunk enable boot-start -user archStudent
 
