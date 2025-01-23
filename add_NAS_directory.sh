#!/bin/bash

# ユーザー名を取得
USERNAME=$(whoami)

# ショートカットを作成するディレクトリ
SHORTCUT_DIR="$HOME"

# ショートカットの作成
mkdir -p "$SHORTCUT_DIR"

# ユーザー名のショートカット
ln -s "/export/home/$USERNAME" "$SHORTCUT_DIR/${USERNAME}"

# Publicのショートカット
ln -s "/export/public" "$SHORTCUT_DIR/Public"

echo "ショートカットを作成しました！"
echo "  - ユーザー: $SHORTCUT_DIR/${USERNAME} → /export/home/$USERNAME"
echo "  - Public:  $SHORTCUT_DIR/Public → /export/public"
