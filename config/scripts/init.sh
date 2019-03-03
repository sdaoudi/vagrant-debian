#!/bin/bash

# Stop & remove all containers if already started
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)

# run traefik container
docker run -d \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /vagrant/config/traefik/traefik.toml:/traefik.toml \
  -p 80:80 \
  -l traefik.frontend.rule=Host:traefik.local \
  -l traefik.port=8181 \
  --network bridge \
  --name traefik \
  traefik:1.7.2-alpine

# run portainer container
docker volume create portainerdata
docker run -d \
	-p 9005:9000 \
	--restart always \
	-v /var/run/docker.sock:/var/run/docker.sock \
	-v portainerdata:/data \
	--name portainer \
	portainer/portainer

# run mariadb database container
docker run -d \
	-p 3306:3306 \
	--restart always \
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
