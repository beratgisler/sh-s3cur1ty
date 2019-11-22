#!/bin/bash

echo -ne " Enter your domain :"
read domain

ns=$(dig +noall +answer NS $domain | awk '{print $5}')
for site in $ns
do
	dig +short @$site AXFR $domain
done
