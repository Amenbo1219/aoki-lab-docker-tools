#!/bin/bash

# スクリプトをroot権限で実行していることを確認
if [ "$(id -u)" != "0" ]; then
   echo "このスクリプトはroot権限で実行する必要があります" 1>&2
   exit 1
fi

echo "30日間使用していないDockerイメージのクリーンアップを開始します..."

# 30日以上前の日付を計算
threshold_date=$(date -d '7 days ago' +%Y-%m-%dT%H:%M:%S)

# 全ユーザーのDockerイメージをチェック
for user in $(cut -d: -f1 /etc/passwd); do
    if id "$user" &>/dev/null; then
        echo "ユーザー $user のDockerイメージをチェック中..."
        sudo -u $user XDG_RUNTIME_DIR=/run/user/$(id -u $user) \
            docker images --format '{{.ID}} {{.Repository}}:{{.Tag}} {{.CreatedAt}}' | while read -r image_id image_name created_at; do
                # イメージの作成日が閾値日付より前かどうかを確認
                if [[ $(date -d "$created_at" +%Y-%m-%dT%H:%M:%S) < $threshold_date ]]; then
                    echo "削除対象: $image_name (ID: $image_id, 作成日: $created_at)"
                    sudo -u $user XDG_RUNTIME_DIR=/run/user/$(id -u $user) \
                        docker rmi $image_id
                fi
            done
    fi
done

echo "30日間使用していないDockerイメージのクリーンアップが完了しました"
