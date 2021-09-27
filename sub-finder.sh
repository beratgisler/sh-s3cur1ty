#!/bin/bash
echo '*********************************'
echo '************SUBFINDER************'
echo '*********************************'
echo ' waiting for processing .. .. .. .. ' 
wget -q xxx.edu.tr

cat index.html | grep "href=" | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | sort -u > xxx-sub.txt

cat xxx-sub.txt | cut -d "'" -f 1 | grep .edu.tr > sublist.txt

rm -r xxx-sub.txt
rm -r index*

echo '//// SUBDOMAINS \\\\'
cat sublist.txt



