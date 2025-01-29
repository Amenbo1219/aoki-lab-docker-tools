#!/bin/bash

# Lingerを有効化
loginctl enable-linger $USER

# XDG_RUNTIME_DIRを設定
export XDG_RUNTIME_DIR="/run/user/$UID"

# 必要なディレクトリを作成（存在しない場合）
if [ ! -d "$XDG_RUNTIME_DIR" ]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
    chown "$USER:$USER" "$XDG_RUNTIME_DIR"
fi

# dockerd-rootless-setuptool.sh の実行
dockerd-rootless-setuptool.sh install

# PATHとDOCKER_HOSTを設定
export PATH="/usr/bin:$PATH"
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"

# Dockerサービスを設定
systemctl --user enable docker.service
systemctl --user start docker.service
systemctl --user restart docker.service
