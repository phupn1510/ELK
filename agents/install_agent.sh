#!/bin/bash


IP_ELK=10.123.0.108 

/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.2-amd64.deb
/usr/bin/dpkg -i filebeat-5.0.2-amd64.deb

/usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.2-amd64.deb
/usr/bin/dpkg -i metricbeat-5.0.2-amd64.deb


 apt-get install libpcap0.8 
 /usr/bin/curl -L -O https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.0.2-amd64.deb
 /usr/bin/dpkg -i packetbeat-5.0.2-amd64.deb

 /bin/sed -i 's/localhost/'$IP_ELK'/g' filebeat.yml
 /bin/sed -i 's/localhost/'$IP_ELK'/g' metricbeat.yml
 /bin/sed -i 's/localhost/'$IP_ELK'/g' packetbeat.yml
 cp filebeat.yml /etc/filebeat/filebeat.yml
 cp metricbeat.yml /etc/metricbeat/metricbeat.yml
 cp packetbeat.yml /etc/packetbeat/packetbeat.yml
 /etc/init.d/filebeat restart
 /etc/init.d/metricbeat restart
 /etc/init.d/packetbeat restart