PROFILE_FILE="$HOME/.profile"
BASH_CHECK_CODE='if [ -z "$BASH_VERSION" ]; then
    exec /bin/bash
fi'

# ~/.profile にすでに該当するコードが存在するか確認
#if grep -qxF "$BASH_CHECK_CODE" "$PROFILE_FILE"; then
#    echo "The BASH check code is already present in $PROFILE_FILE. No changes made."
#else
    # コードを追記
echo -e "\n# Automatically added to ensure Bash shell\n$BASH_CHECK_CODE" >> "$PROFILE_FILE"
echo "The BASH check code has been added to $PROFILE_FILE."
#fi
export PATH="$HOME/bin:$PATH"
export SHELL=/bin/bash
exec $SHELL
