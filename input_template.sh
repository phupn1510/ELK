#!/bin/bash
/usr/bin/curl -XPUT 'http://localhost:9200/_template/topbeat' -d@./index_template/topbeat.template.json
/usr/bin/curl -XPUT 'http://localhost:9200/_template/filebeat' -d@./index_template/filebeat.template.json
/usr/bin/curl -XPUT 'http://localhost:9200/_template/packetbeat' -d@./index_template/packetbeat.template.json
/usr/bin/curl -XPUT 'http://localhost:9200/_template/collectd' -d@./index_template/collectd.template.json
/usr/bin/curl -XPUT 'http://localhost:9200/_template/metricbeat' -d@./index_template/metricbeat.template.json