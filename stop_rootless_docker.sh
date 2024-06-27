#!/bin/bash

# スクリプトをroot権限で実行していることを確認
if [ "$(id -u)" != "0" ]; then
   echo "このスクリプトはroot権限で実行する必要があります" 1>&2
   exit 1
fi

echo "Rootless Dockerクライアントの停止を開始します..."

# 全ユーザーのDockerデーモンを停止
for user in $(cut -d: -f1 /etc/passwd); do
    if id "$user" &>/dev/null; then
        echo "ユーザー $user のDockerデーモンを停止中..."
        sudo -u $user XDG_RUNTIME_DIR=/run/user/$(id -u $user) \
            systemctl --user stop docker 2>/dev/null || true
    fi
done

echo "全ユーザーのDockerデーモンの停止を試みました"

# 残存するDockerプロセスを確認
remaining_processes=$(ps aux | grep docker | grep -v grep)
if [ ! -z "$remaining_processes" ]; then
    echo "残存するDockerプロセスを強制終了します..."
    pkill -f docker
    pkill rootless-dockerd
fi

# 全てのDockerコンテナの強制停止（オプション）
read -p "全てのDockerコンテナを強制停止しますか？ (y/n): " answer
if [[ $answer =~ ^[Yy]$ ]]; then
    for user in $(cut -d: -f1 /etc/passwd); do
        if id "$user" &>/dev/null; then
            echo "ユーザー $user のDockerコンテナを停止中..."
            sudo -u $user docker ps -q | xargs -r docker stop 2>/dev/null || true
        fi
    done
    echo "全てのDockerコンテナの停止を試みました"
fi

echo "Rootless Dockerクライアントの停止処理が完了しました"
