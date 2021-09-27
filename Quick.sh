#!/bin/bash
#Author:0xs1k1nt1

banner()
{
  echo "+--------------------------------------------------------------+"
  printf "| %-60s |\n" "`date`"
  echo "|                                                              |"
  printf "| `tput setaf 2` `tput bold` %-58s `tput sgr0`|\n" "$@"
  echo "+--------------------------------------------------------------+"
}

banner "Say Hai! 2 The Fast Check || Created by 0xs1k1nt1"
echo -ne "Subnet or IP:" 
read scope
mkdir ScanResults 

banner "Checking MS17-010...."
nmap -n -Pn -sV -p445 $scope --script smb-vuln-ms17-010 > ScanResults/ms17-010.txt
banner "Checking SMB Shares...."
nmap -n -Pn -sV -p 445 -T5 $scope --script smb-enum-shares > ScanResults/smb-enumshares.txt
banner "Checking SMB Users...."
nmap -n -Pn -p 445 -T5 $scope --script smb-enum-users > ScanResults/smb-enumusers.txt
banner "Checking FTP Anonymously...."
nmap -n -Pn -sV -sC -p 21 $scope -T5 > ScanResults/FTP-check.txt 
banner "Checking MySQL Empty Password...."
nmap -n -Pn -sV -p 1433,3306  $scope --script mysql-empty-password > ScanResults/mysql-empty-password.txt
banner "Checking HTTP Enum...."
nmap -n -sV -p 80,443 $scope --script http-enum > ScanResults/http-enum.txt
banner "Checking Firewall Management...."
nmap -sT portquiz.net -p- -v > ScanResults/fw-management.txt

banner "You can check the ScanResults Directory now :)"


