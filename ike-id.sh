#!/bin/bash

#I wrote this script for my own needs, but why shouldn't everyone use it :)
#Mucahit Ceri

if [ $# -lt 2 ]
then
	echo "Usage: ./ike-id <IP> <Wordlist>"
	exit 0
fi

while read file
do
	echo "[?] Trying: " $file
	if ike-scan -M -A -n $file $1 | grep -i "1 returned handshake"
	then
	echo "[+] Correct id:" $file
	exit 0
	else
	echo "[-] False id : " $file
	sleep 0.5 
	fi
done < $2

