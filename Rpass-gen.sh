#! /bin/bash
# Author: 0xs1k1nt1
# 2021-09-19 

banner()
{
  echo "+--------------------------------------------------------------+"
  printf "| %-60s |\n" "`date`"
  echo "|                                                              |"
  printf "| `tput setaf 2` `tput bold` %-58s `tput sgr0`|\n" "$@"
  echo "+--------------------------------------------------------------+"
}

banner "Welcome to the report Zipp3r =) | created by r00t1x..."
echo -ne "File Name:"
read pathname 
echo -ne "Customer Name:"
read customer
echo " "

echo "+--------------------------------------------------------------+"
rand="$(date +%s | sha256sum | base64 | head -c 32 ; echo)"
rand2="$(</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB<>()/' | head -c16 | md5sum | cut -f 1 -d " ")"
rand3="$(tr -dc A-Za-z0-9 </dev/urandom | head -c 12 ; echo '')"

echo "Generated Report Password: ${rand}" > ${customer}.passwd
echo "Generated Zip Password: ${rand2}" >> ${customer}.passwd
echo "Generated FileShare Password: ${rand3}" >> ${customer}.passwd

echo "Generated Report Password: ${rand}"
echo "Generated Zip Password: ${rand2}"
echo "Generated FileShare Password: ${rand3}"
echo "+--------------------------------------------------------------+"

echo "Your Passwords Has Been Saved ${customer}.passwd"

echo "+--------------------------------------------------------------+"
echo " "
zip -q -P $rand2 $customer.zip $pathname && echo "success !!" || echo "failure... Check your file path or name !!!"
echo "Password Protected Zip Name:${customer}.zip"
echo "+--------------------------------------------------------------+"
