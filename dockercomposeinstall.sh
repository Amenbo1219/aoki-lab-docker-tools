#!/bin/sh
export PATH=~/bin:$PATH
mkdir -p ~/bin
curl -L "https://github.com/docker/compose/releases/download/v2.17.3/docker-compose-$(uname -s)-$(uname -m)" -o ~/bin/docker-compose

sleep 3
chmod +x ~/bin/docker-compose
