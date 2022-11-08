#!/bin/sh
# Use git to find and remove all .zip files that are older than 90 days
# Note: This only works on a mac.
date=$(date -v -90d +%Y-%m-%d)
echo "date:${date}"
git ls-files '*.zip' | while read path
do
  if [ "$(git log --since \"$date\" -- $path)" == "" ]; then
    echo "Removing: $path"
    rm "$path"
  fi
done
