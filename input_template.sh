#!/bin/bash
/usr/bin/curl -XPUT 'http://127.0.0.1:9200/_template/topbeat' -d@./index_template/topbeat.template.json
/usr/bin/curl -XPUT 'http://127.0.0.1:9200/_template/filebeat' -d@./index_template/filebeat.template.json
/usr/bin/curl -XPUT 'http://127.0.0.1:9200/_template/packetbeat' -d@./index_template/packetbeat.template.json
/usr/bin/curl -XPUT 'http://127.0.0.1:9200/_template/collectd' -d@./index_template/collectd.template.json
/usr/bin/curl -XPUT 'http://127.0.0.1:9200/_template/metricbeat' -d@./index_template/metricbeat.template.json
/usr/bin/curl -XPUT 'http://127.0.0.1:9200/_template/heartbeat' -d@./index_template/metricbeat.template.json
/usr/bin/curl -XPUT 'http://127.0.0.1:9200/_template/winlogbeat' -d@./index_template/winlogbeat.template.json
