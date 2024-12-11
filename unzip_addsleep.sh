#!/bin/bash

usage() {
    echo "Usage: $0 <zip_file> [destination_folder]"
    exit 1
}

if [ "$#" -lt 1 ]; then
    usage
fi

ZIP_FILE="$1"
DEST_DIR="${2:-.}"  

# 一度に処理するファイル数
BATCH_SIZE=25

# スリープ時間（秒）
SLEEP_TIME=5

mkdir -p "$DEST_DIR"

file_list=$(unzip -Z1 "$ZIP_FILE")

counter=0

for file in $file_list; do
    # 解凍する
    unzip -o "$ZIP_FILE" "$file" -d "$DEST_DIR"
    echo "Unzipped: $file"

    ((counter++))

    if (( counter % BATCH_SIZE == 0 )); then
        echo "!!!DATA WRITTING!!!Sleeping for $SLEEP_TIME seconds..."
        sleep $SLEEP_TIME
    fi
done

echo "All files processed!"

