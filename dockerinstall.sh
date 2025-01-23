#!/bin/sh
loginctl enable-linger $USER
dockerd-rootless-setuptool.sh install
sleep 3
export XDG_RUNTIME_DIR=/run/user/$UID
export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/$UID/docker.sock
sleep 3
systemctl --user enable docker
systemctl --user start docker
sleep 3
mkdir -p ~/.config/docker
echo "{\"data-root\":\"/docker-cache/$USER/\"}" > ~/.config/docker/daemon.json
mkdir -p /docker-cache/$USER/
sleep 1
systemctl --user restart docker

