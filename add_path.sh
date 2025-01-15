PROFILE_FILE="$HOME/.profile"
BASH_CHECK_CODE='if [ -z "$BASH_VERSION" ]; then
    exec /bin/bash
fi'

# ~/.profile に該当するコードがすでに存在するか確認
if grep -qxF "$BASH_CHECK_CODE" "$PROFILE_FILE"; then
    echo "The BASH check code is already present in $PROFILE_FILE. No changes made."
else
    # コードを追記
    echo "$BASH_CHECK_CODE" >> "$PROFILE_FILE"
    echo "The BASH check code has been added to $PROFILE_FILE."
fi

# パスとデフォルトシェルを設定
echo 'export PATH="$HOME/bin:$PATH"' >> "$PROFILE_FILE"
echo 'export SHELL=/bin/bash' >> "$PROFILE_FILE"

# 新しい設定を反映
export PATH="$HOME/bin:$PATH"
export SHELL=/bin/bash"

# 新しいシェルを起動
exec $SHELL
