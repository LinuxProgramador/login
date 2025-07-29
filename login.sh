#!/bin/bash

#Login in bash for userland
#Prepared by JP Rojas

Exit=$(ps | grep bash | cut -d'p' -f1 )
password_local=$(cat /home/.password | base64 -d | cut -f1)
user=$(whoami | cut -f1)

function login {
  clear
  neofetch
  echo -e "\033[1;33mNOTE: Number of attempts available 10"
  echo -e "\033[1;33mNOTE: su or su root for superuser!"
  echo -e "\033[1;33mNOTE: To update or install packages, first access the root user, DO NOT USE SUDO!!!!!"
  echo -e "\033[1;37m"
  for _ in {1..10} ; do
     read -sp "Enter your password: " pass
     echo ""
     pass=$(echo $pass | shasum -a 512 | cut -f1)
     if [ "$pass" = "$password_local" ] ; then
        echo "Access granted!"
        exit

     else
         echo "Incorrect password!"
     fi
  done
  clear
  echo "Leaving userland!"
  sleep 1
  kill -9 $Exit

}

function main {
   trap "clear && echo 'Invalid option!' && sleep 1 &&  kill -9 $Exit" 2 20
   if [ "$user" != 'root'  ] ; then
         login
   fi
}
main

