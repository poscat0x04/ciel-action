#!/usr/bin/env bash
set -ex

num=$(random 1 1000000)
inst="action-$num"

function cleanup() {
  sudo ciel del "$inst"
}
trap cleanup EXIT

sudo ciel add "$inst"
while read -r line; do
  sudo ciel build -i "$inst" "$line"
done < "$INPUT_PACKAGES_FILE"
