#!/bin/bash
mkdir -p /opt/elasticsearch/data
chmod 766 -R /opt/elasticsearch/data
chmod 766 -R logstash/tmp
net=$(ifconfig eth0 | awk '/inet addr/{print substr($2,6)}')
#sed -i 's/original/new/g' file.txt

/bin/sed -i 's/localhost/'$net'/g' nginx/default.conf
/bin/sed -i 's/localhost/'$net'/g' kibana/config/kibana.yml
/bin/sed -i 's/localhost/'$net'/g' logstash/config/first-pipeline.conf
/bin/sed -i 's/localhost/'$net'/g' logstash/config/second-pipeline.conf
/bin/sed -i 's/localhost/'$net'/g' input_template.sh
echo 'vm.max_map_count=262144' >> /etc/sysctl.conf
/sbin/sysctl -p
