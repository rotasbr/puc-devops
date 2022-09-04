#!/bin/bash
sudo apt update
sudo apt upgrade
sudo apt-get update
sudo apt-get install -y curl wget
sudo curl -fsSL https://get.docker.com | bash
sudo docker swarm init
#docker service create -p 80:80 --name nginx
#sudo docker images
sudo docker run -d --name nginx -p 80:80 nginx

mkdir /var/www
mkdir /var/www/html

sudo apt install nfs-common
sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-031a581b2c1062ba1.efs.us-east-1.amazonaws.com:/ /var/www/html
sudo chmod go+rw /var/www/html
