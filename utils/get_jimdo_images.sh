#!/usr/bin/env bash
#
# Script to download all images in full resolution from a Jimdo website
#

DOMAIN="www.roessle.eu"
target_directory=$1

if [ -z "$target_directory" ]
then
  echo -e "\nUsage:\n$0 target_directory"
  exit 1
fi

paths=`wget --execute robots=off --spider --recursive --no-directories --span-hosts \
     --domains "image.jimcdn.com,$DOMAIN" --page-requisites \
     --accept jpg,jpeg,png --no-verbose "$DOMAIN" 2>&1 \
     | grep '\.\(png\|jpg\|jpeg\)' \
     | awk '{ print $4 }' \
     | sed 's/.*\/path\/\(.*\)/\/path\/\1/g' \
     | sort \
     | uniq`

for path in $paths; do
  filename=$(basename "$path")
  format="${filename##*.}"
  checksum=$(md5 -q -s "$path")
  echo "Writing file ${target_directory}/${checksum}.${format}"
  curl -s "https://image.jimcdn.com/app/cms/image/transf/none${path}" \
    -o "${target_directory}/${checksum}.${format}"
done
