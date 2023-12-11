#!/bin/sh
# Use git to find and remove all .zip files that are older than 90 days
date=$(date --date='90 days ago' +%Y-%m-%d)
echo "date:${date}"
git ls-files '*.zip' | while read path
do
  if [ "$(git log --since \"$date\" -- $path)" == "" ]; then
    echo "Removing: $path"
    rm "$path"
  fi
done
