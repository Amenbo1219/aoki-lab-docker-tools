#!/bin/bash

usage() {
    echo "Usage: $0 <tar_file> [destination_folder]"
    exit 1
}

if [ "$#" -lt 1 ]; then
    usage
fi

TAR_FILE="$1"
DEST_DIR="${2:-.}"  

BATCH_SIZE=25

SLEEP_TIME=5

mkdir -p "$DEST_DIR"

file_list=$(tar -tzf "$TAR_FILE")

counter=0

for file in $file_list; do
    # 解凍する
    tar --extract --gzip --file="$TAR_FILE" --directory="$DEST_DIR" "$file"
    echo "Extracted: $file"

    ((counter++))

    if (( counter % BATCH_SIZE == 0 )); then
        echo "!!!WRITEIG!!!Sleeping for $SLEEP_TIME seconds..."
        sleep $SLEEP_TIME
    fi
done

echo "All files processed!"

