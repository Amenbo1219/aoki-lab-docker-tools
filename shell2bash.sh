#!/bin/bash

PROFILE_FILE="$HOME/.profile"

# ~/.profile に追記する内容
cat <<'EOL' >> "$PROFILE_FILE"
# Ensure the shell is Bash
if [ -z "$BASH_VERSION" ]; then
    exec /bin/bash
fi

# Add PATH and set default shell to Bash
export PATH="$HOME/bin:$PATH"
export SHELL=/bin/bash
EOL

# 新しいシェルを起動
exec $SHELL
