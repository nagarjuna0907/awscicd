#!/bin/bash
cd /home/ubuntu/
#Install Dynatrace-OneAgent-Linux
sudo wget -O Dynatrace-OneAgent-Linux-1.177.216.sh "https://cjy24006.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?Api-Token=sXMHrcZcSZeaM19J02BSs&arch=x86&flavor=default"
sudo wget https://ca.dynatrace.com/dt-root.cert.pem ; ( echo 'Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="--SIGNED-INSTALLER"'; echo ; echo ; echo '----SIGNED-INSTALLER' ; cat Dynatrace-OneAgent-Linux-1.177.216.sh ) | openssl cms -verify -CAfile dt-root.cert.pem > /dev/null
sudo chmod +x Dynatrace-OneAgent-Linux-1.177.216.sh
sudo /bin/sh Dynatrace-OneAgent-Linux-1.177.216.sh APP_LOG_CONTENT_ACCESS=1 INFRA_ONLY=0 
#Install MySql-Server
sudo apt-get install mysql-server -y



#mysql -h database-1.c15xm7hypcsn.us-east-2.rds.amazonaws.com -P 3306 -u lead -p leadapp123 leadapp</home/ubuntu/schema.sql
#sudo rm -R /home/ubuntu/tomcat7/webapps/leadapp
#sudo rm /home/ubuntu/tomcat7/webapps/leadapp.war
