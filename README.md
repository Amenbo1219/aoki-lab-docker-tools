# aoki-lab-docker-tools
青木研究室サーバRev2023のDockerインストールファイルです．
クローン後のフォルダを環境変数に追加すれば，各ファイルを実行できます．
実行権限の付与とloginctl enable-linger　の付与がされている前提となります．
また，ROOTLESSのソースファイルが/export/home/dockerdに展開されている前提となります．

このリポジトリには、Aoki Labで使用するDockerツールが含まれています。
## 説明
add_NAS_directory.sh:NASのショートカットをホームディレクトリに作成

alldel.sh:Dockerのキャッシュデータ削除

autodel_30d.sh:30日以後のキャッシュデータ削除(自動実行)

contdel_Xd.sh:X日以降経過しているコンテナの削除

dockercomposeinstall.sh:DockerComposeのインストール

dockerinstall-lyon.sh:LyonとFermiのDocker環境構築

dockerinstall.sh:ローカル環境のDocker環境構築

dockerstart.sh:Dockerデーモンの起動

dockerstop.sh:Dockerデーモンの停止

imdel_Xd.sh:X日以降経過しているイメージの削除

shell2bash.sh:シェルのBASH変更

unXXX_addsleep.sh:圧縮ファイルの解凍





## インストール方法

1. リポジトリをクローンします：

```bash
git clone https://github.com/Amenbo1219/aoki-lab-docker-tools.git
```

2. クローンしたディレクトリを`bin`にリネームします：

```bash
mv aoki-lab-docker-tools/ bin
```

3. シェルスクリプトに実行権限を付与します：

```bash
chmod 755 ~/bin/*.sh
```

4. パスを追加するスクリプトを実行します：

```bash
./bin/add_path.sh
```
5. 再ログインをします：
```bash
exit
ssh ユーザー名@共有されたホスト情報
```


5. Dockerのセットアップ：
```bash
dockerinstall.sh
dockercomposeinstall.sh
```
これで、Aoki Lab Docker Toolsのセットアップが完了しました。各ツールの使用方法については、個別のドキュメントを参照してください。

Citations:
[1] https://github.com/Amenbo1219/aoki-lab-docker-tools.git
