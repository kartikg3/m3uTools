#!/bin/bash
# This script copies all the media files listed in the source m3u playlist file into the destination folder location.
#
# usage:
# ./m3u-cp.sh m3u_file destination_folder
# The destination folder will be created if it does not exist

m3u_source=$1
destination=$2

sed 's/\\/\//g' $m3u_source | sed 's/://g' > tempfile

mkdir $destination

while read line
do
  if [[ ${#line} -gt 0 ]]
  then
    if [ ${line:0:1} != "#" ]
    then
      source=/$line
      cp "$source" "$destination"
    fi
  fi
done < tempfile

rm tempfile
