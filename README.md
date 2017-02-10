DOCKER_ELK by PHU PHAN NHAT



Requirements:
      - Please install Docker and docker-compose 

```
https://docs.docker.com/engine/installation/linux/ubuntulinux/
https://docs.docker.com/compose/install/
```	  
	  
Please install as following instructions:
```
 chmod +x pre_install.sh
 ./pre_install.sh
```
This script to get IP address of host and create storage of ES data
```
 docker-compose up -d
``` 
 for background running all ELK components docker
``` 
 docker-compose up
 ```
 for interactive running all ELK components docker (Ctrl+C will stop all containers) to easily get logs
 
 
 ```
 chmod +x input_template.sh
 ./input_template.sh
 ```
 This script to create a template of ES index
 
 
 Note: you can change network interface you want to bind address by editing pre_install script. Example eth0
 
 Note: if you want install plugin for logstash please using ADD in Dockerfile located in logstash folder
 
 Note: /opt/elasticsearch/data will be storage of Elasticsearch Container
 
 *********** Note: nginx user: admin/aavn123!@# ************* (you can add httpasswd at nginx.conf)
 
 
 *******Install agents please go to agents folder********* 
 