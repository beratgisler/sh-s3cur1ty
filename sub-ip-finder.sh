#! /bin/bash 

for url in $(cat sublist.txt);do
echo "$url"
host $url | grep "has address" | cut -d " " -f 4
done
