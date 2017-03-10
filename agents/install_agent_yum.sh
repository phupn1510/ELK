#!/bin/bash


IP_ELK=10.123.0.108 
/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-5.2.1-x86_64.rpm
/usr/bin/rpm -vi heartbeat-5.2.1-x86_64.rpm
/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.2.1-x86_64.rpm
/usr/bin/rpm -vi filebeat-5.2.1-x86_64.rpm

/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.2.1-x86_64.rpm
/usr/bin/rpm -vi metricbeat-5.2.1-x86_64.rpm


sudo yum install libpcap
/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.2.1-x86_64.rpm
/usr/bin/rpm -vi packetbeat-5.2.1-x86_64.rpm

 /bin/sed -i 's/127.0.0.1/'$IP_ELK'/g' filebeat.yml
 /bin/sed -i 's/127.0.0.1/'$IP_ELK'/g' metricbeat.yml
 /bin/sed -i 's/127.0.0.1/'$IP_ELK'/g' packetbeat.yml
 /bin/sed -i 's/127.0.0.1/'$IP_ELK'/g' heartbeat.yml
 cp filebeat.yml /etc/filebeat/filebeat.yml
 cp metricbeat.yml /etc/metricbeat/metricbeat.yml
 cp packetbeat.yml /etc/packetbeat/packetbeat.yml
 cp heartbeat.yml /etc/heartbeat/heartbeat.yml
 cp logstash-forwarder.crt /etc/pki/tls/certs/
 cp ca.pem /etc/ca.pem
 cp client.crt /etc/client.crt
 cp client.key /etc/client.key
 /etc/init.d/filebeat restart
 /etc/init.d/metricbeat restart
 /etc/init.d/packetbeat restart
 /etc/init.d/hearbeat restart
