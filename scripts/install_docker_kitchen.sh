#!/bin/bash
#
# This script installs Docker

# Install and start docker-engine
sudo dnf -y remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine
sudo dnf -y install dnf-plugins-core
sudo dnf -y config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf -y install docker-ce
sudo groupadd docker
sudo usermod -aG docker vagrant
sudo systemctl start docker
sudo systemctl enable docker

# Test docker install
docker run hello-world
if test $? -ne 0; then
  echo "Error: docker-engine install failed"
  exit 1
fi

# Install the docker driver for the user who launched the present script
sudo su - vagrant -c 'eval "$(chef shell-init bash)" && gem install kitchen-docker'
