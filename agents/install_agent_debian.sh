#!/bin/bash


IP_ELK=127.0.0.1 
/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/heartbeat/heartbeat-5.2.1-amd64.deb
/usr/bin/dpkg -i heartbeat-5.2.1-amd64.deb
/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.2.1-amd64.deb
/usr/bin/dpkg -i filebeat-5.2.1-amd64.deb
/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.2.1-amd64.deb
/usr/bin/dpkg -i metricbeat-5.2.1-amd64.deb
sudo apt-get install libpcap0.8
/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.2.1-amd64.deb
/usr/bin/dpkg -i packetbeat-5.2.1-amd64.deb

/bin/sed -i 's/222.255.166.70/'$IP_ELK'/g' filebeat.yml
/bin/sed -i 's/222.255.166.70/'$IP_ELK'/g' metricbeat.yml
/bin/sed -i 's/222.255.166.70/'$IP_ELK'/g' packetbeat.yml
/bin/sed -i 's/222.255.166.70/'$IP_ELK'/g' heartbeat.yml
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
/etc/init.d/heartbeat restart
