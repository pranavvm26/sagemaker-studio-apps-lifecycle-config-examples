#!/bin/bash
input_file="spec-file.txt"
target_dir="./conda_pkgs"

mkdir -p "$target_dir"

grep -Eo "https://[^ ]+" "$input_file" | while read -r url; do
    wget --no-check-certificate -P "$target_dir" "$url"
done
