#!/bin/sh
loginctl enable-linger $USER
export XDG_RUNTIME_DIR=/run/user/$UID
bash dockerd-rootless-setuptool.sh install
sleep 3
export PATH=/usr/bin:$PATH
export DOCKER_HOST=unix:///run/user/$UID/docker.sock
sleep 3
systemctl --user enable docker
systemctl --user start docker
sleep 1
systemctl --user restart docker
