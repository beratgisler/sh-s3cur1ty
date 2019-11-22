#!/bin/bash
echo '*********************************'
echo '************SUBFINDER************'
echo '*********************************'
echo ' waiting for processing .. .. .. .. ' 
wget -q omu.edu.tr

cat index.html | grep "href=" | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | sort -u > omu-sub.txt

cat omu-sub.txt | cut -d "'" -f 1 | grep .edu.tr > sublist.txt

rm -r omu-sub.txt
rm -r index*

echo '//// SUBDOMAINS \\\\'
cat sublist.txt



