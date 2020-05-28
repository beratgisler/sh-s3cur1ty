#!/bin/bash 

#public ip results multiple source
echo "--------------------------------"
echo " Public IP Address Results "
ifconfigme="$(curl -s ifconfig.me | grep -v "%")"
icanhazip="$(curl -s icanhazip.com)"
ipecho="$(curl -s ipecho.net/plain | grep -v "%")"
ifconfigio="$(curl -s ifconfig.io)"
whatismyip="$(curl -s ipv4bot.whatismyipaddress.com | grep -v '%')"
opendns="$(dig +short myip.opendns.com @resolver1.opendns.com)"

echo "--------------------------------"
#country results multiple source

country="$(curl -s ifconfig.io/country_code)"


# just results 

echo "ifconfig.me result: ${ifconfigme}"
echo "icanhazip result: ${icanhazip}"
echo "ipecho result: ${ipecho}"
echo "ifconfig.io result: ${ifconfigio}"
echo "whatismyip result: ${whatismyip}"
echo "opendns result: ${opendns}"
echo "-------------------------------"
echo "Country Information: ${country}"
echo "-------------------------------"
