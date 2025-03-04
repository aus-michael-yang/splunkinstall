#!/bin/sh

 ##WGET_CMD="wget -O splunk-8.2.3-cd0848707637-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/8.2.3/linux/splunk-8.2.3-cd0848707637-Linux-x86_64.tgz"
 ##WGET_CMD="wget -O splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/8.2.4/linux/splunk-8.2.4-87e2dda940d1-Linux-x86_64.tgz"
 ##WGET_CMD="wget -O splunk-8.2.6-a6fe1ee8894b-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/8.2.6/linux/splunk-8.2.6-a6fe1ee8894b-Linux-x86_64.tgz"
 ##WGET_CMD="wget -O splunk-9.0.1-82c987350fde-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/9.0.1/linux/splunk-9.0.1-82c987350fde-Linux-x86_64.tgz"
 WGET_CMD="wget -O splunk-9.0.2-17e00c557dc1-Linux-x86_64.tgz https://download.splunk.com/products/splunk/releases/9.0.2/linux/splunk-9.0.2-17e00c557dc1-Linux-x86_64.tgz"
 INSTALL_FILE="splunk-*"
 PASSWORD="ExpertInsight"


 cd /opt
 sudo yum install wget
 sudo $WGET_CMD
 sudo tar -xvzf $INSTALL_FILE
 sudo rm -rf $INSTALL_FILE

 #sudo useradd -m -r splunk

 sudo /opt/splunk/bin/splunk start --accept-license --answer-yes --auto-ports --no-prompt --seed-passwd $PASSWORD
 sudo /opt/splunk/bin/splunk stop -auth admin:$PASSWORD
 #sudo chown -R splunk:splunk /opt/splunk
 sudo chown -R ubuntu:ubuntu /opt/splunk
 sudo -u ubuntu /opt/splunk/bin/splunk restart
 sudo /opt/splunk/bin/splunk enable boot-start -user ubuntu
