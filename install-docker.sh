#!/bin/bash

echo -e "$(tput setaf 6)Updating packages..." &&
apt-get update &&

echo -e "\n$(tput setaf 6)Downloading OpenPGP certificates, ca-certificates and enable APT to access metadata and packages over HTTPS." &&
echo -ne "$(tput setaf 7)" &&
apt-get install -y apt-transport-https ca-certificates &&
apt-get install dirmngr -y &&

echo -e "\n$(tput setaf 6)Adding the appropriate PGP key..." &&
echo -ne "$(tput setaf 7)" &&
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 \
--recv-keys 58118E89F3A912897C070ADBF76221572C52609D &&

echo -e "\n$(tput setaf 6)Adding the appropriate Docker source entry..." &&
echo -ne "$(tput setaf 7)" &&
echo 'deb https://apt.dockerproject.org/repo debian-stretch main' > \
/etc/apt/sources.list.d/docker.list &&

echo -e "\n$(tput setaf 6)Updating packages again..." &&
echo -ne "$(tput setaf 7)" &&
apt-get update &&

echo -e "\n$(tput setaf 6)Installing Docker now..." &&
echo -ne "$(tput setaf 7)" &&
apt-get install docker-engine &&

echo -e "\n$(tput setaf 6)Starting Docker service..." &&
echo -ne "$(tput setaf 7)" &&
service docker start &&

echo -e "\n$(tput setaf 6)Verifying Docker is working properly... Make sure you see Docker message that says your installation is working properly." &&
echo -ne "$(tput setaf 3)" &&
docker run hello-world
