DOCKER_ELK by PHU PHAN NHAT
Requirements:
      - Please install Docker and docker-compose 
Please install as following instructions:
```
 chmod +x pre_install.sh
 ./pre_install.sh
```
Note: you can change network interface you want to bind address by editing pre_install script. Example eth0
```
 docker-compose up -d
``` 
 for background running
``` 
 docker-compose up
 ```
 for interactive running
 
 Note: if you want install plugin for logstash please using ADD in Dockerfile located in logstash folder
 
 ```
 chomod +x input_template.sh
 ./input_template.sh
 ```
 
 Install agents please go to agents folder 
 