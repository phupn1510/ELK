#!/bin/bash
mkdir -p /home/elasticsearch/data
chmod 766 -R /home/elasticsearch/data
chmod 766 -R logstash/tmp
net=$(ifconfig ens32 | awk '/inet addr/{print substr($2,6)}')
#sed -i 's/original/new/g' file.txt
chmod -R 777 ./kibana/kibana
/bin/sed -i 's/222.255.166.70/'$net'/g' nginx/default.conf
/bin/sed -i 's/127.0.0.1/'$net'/g' kibana/config/kibana.yml
#/bin/sed -i 's/localhost/'$net'/g' logstash/config/first-pipeline.conf
#/bin/sed -i 's/localhost/'$net'/g' logstash/config/second-pipeline.conf
/bin/sed -i 's/127.0.0.1/'$net'/g' input_template.sh
echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
/sbin/sysctl -p
