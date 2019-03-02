#!/bin/bash

# Stop & remove all containers if already started
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# run portainer container
docker volume create portainerdata
docker run -d -p 9005:9000 --name portainer --restart always \
-v /var/run/docker.sock:/var/run/docker.sock \
-v portainerdata:/data \
portainer/portainer

# run mariadb database container
docker run -d -p 3306:3306 --name mariadb --restart always \
-e MYSQL_ROOT_PASSWORD=pouf -d mariadb

# run phpmyadmin container
docker run -d --name phpmyadmin --restart always \
--link mariadb:db -p 8081:80 phpmyadmin/phpmyadmin
