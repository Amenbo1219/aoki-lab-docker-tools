# 引数の数を確認
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <ユーザ名> <uid>"
    exit 1
fi

# 引数の割り当て
USER_NAME=$1
USERID=$2

# ホームディレクトリを設定
HOME_DIR="/export/home/$USER_NAME"

# ユーザーの追加
sudo adduser --uid $USERID --gid 100 --home $HOME_DIR $USER_NAME


# loginctl enable-linger 実行
sudo loginctl enable-linger $USERID
