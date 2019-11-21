#! /bin/bash 

canli_kanli_ping()
{
	ping -c 1 $1 > /dev/null
	[ $? -eq 0 ] && echo IP Adresi: $i canli.
}

for i in 192.168.1.{1..255}
do
canli_kanli_ping $i + disown 
done
