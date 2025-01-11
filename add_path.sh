#!/bin/bash
export PATH="$HOME/bin:$PATH"
# 確認用メッセージ
echo "Setting up bash auto-switch in ~/.profile or ~/.bash_profile..."

# 追加する内容
CONFIG="if [ -z \"\$BASH_VERSION\" ]; then
    exec /bin/bash
fi"

# 対象ファイル（~/.profile を優先し、なければ ~/.bash_profile に追加）
TARGET_FILE="$HOME/.profile"
if [ ! -f "$TARGET_FILE" ]; then
    TARGET_FILE="$HOME/.bash_profile"
fi
