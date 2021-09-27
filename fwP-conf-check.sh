#!/bin/bash
# Author: 0xs1k1nt1
# 2021-09-27

banner()
{
  echo "+--------------------------------------------------------------+"
  printf "| %-60s |\n" "`date`"
  echo "|                                                              |"
  printf "| `tput setaf 2` `tput bold` %-58s `tput sgr0`|\n" "$@" " " "Created by 0xs1k1nt1"
  echo "+--------------------------------------------------------------+"
}

banner "Firewall & Web Proxy Config Checker"
echo "Openable ports are shown below:" > /tmp/FW-ProxyCheck.txt
echo " " >> /tmp/FW-ProxyCheck.txt

# simple command for detection and write file for examination
nmap -sT --top-port 3333 portquiz.net -T5| grep -i open >> /tmp/FW-ProxyCheck.txt
cat /tmp/FW-ProxyCheck.txt 
echo " "
echo "Results has been saved on '/tmp/FW-ProxyCheck.txt'"
echo " "
echo "These ports are open to outside connection, the system administrator should be use FW, Web Proxy, or generate rules about the unknown ports."
