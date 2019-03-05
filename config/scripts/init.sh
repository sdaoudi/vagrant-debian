#!/bin/bash

# Stop & remove all containers if already started
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# run traefik container
docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /vagrant/config/traefik/traefik.toml:/traefik.toml \
  -p 80:80 \
  --restart always \
  -l traefik.frontend.rule=Host:traefik.local \
  -l traefik.port=8181 \
  --network bridge \
  --name traefik \
  traefik:1.7.2-alpine

# run portainer container
PORTAINER_DIR="/home/vagrant/data/portainer"
if [ ! -d "$PORTAINER_DIR" ]; then
    mkdir -p $PORTAINER_DIR
fi
docker run -d \
	-p 9005:9000 \
	--restart always \
	-v /var/run/docker.sock:/var/run/docker.sock \
        -v ${PORTAINER_DIR}:/data \
	--name portainer \
	portainer/portainer

# run mariadb database container
MYSQL_DIR="/home/vagrant/data/mysql"
if [ ! -d "$MYSQL_DIR" ]; then
    mkdir -p $MYSQL_DIR
fi
docker run -d \
	-p 3306:3306 \
	--restart always \
        -v ${MYSQL_DIR}:/var/lib/mysql \
	-e MYSQL_ROOT_PASSWORD=pouf \
	--network bridge \
	--name mariadb \
	mariadb

# run phpmyadmin container
docker run -d \
	--restart always \
	--link mariadb:db \
	-p 8081:80 \
	--name phpmyadmin \
	phpmyadmin/phpmyadmin
