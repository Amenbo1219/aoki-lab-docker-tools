#!/bin/sh

# Lingerを有効化
loginctl enable-linger "$USER"

# XDG_RUNTIME_DIRを設定
export XDG_RUNTIME_DIR="/run/user/$UID"

# 必要なディレクトリを作成
if [ ! -d "$XDG_RUNTIME_DIR" ]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
    chown "$USER:$USER" "$XDG_RUNTIME_DIR"
fi

# dockerd-rootless-setuptoolの実行
bash dockerd-rootless-setuptool.sh install

# PATHとDOCKER_HOSTを設定
export PATH="/usr/bin:$PATH"
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# Dockerサービスを設定
systemctl --user enable docker
systemctl --user start docker
systemctl --user restart docker

mkdir -p ~/.config/docker
echo "{\"data-root\":\"/docker-cache/$USER/\"}" > ~/.config/docker/daemon.json
mkdir -p /docker-cache/$USER/
sleep 1
systemctl --user restart docker

