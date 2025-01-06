#!/bin/bash

path=$(pwd | cut -f1)

function dependencies {
 sudo apt install neofetch procps -y
 clear
 read -sp "Enter the password to use for your login: " pass
 echo ""
 read -sp "Repeat your password: " pass_validation
 echo ""
 if [ "$pass" = "$pass_validation" ] ; then
  echo $pass | shasum -a 512 | base64 > /home/.password
  pass=""
  pass_validation=""
  chmod 600 /home/.password
  chmod 700 $path/login.sh
  clear
  sleep 1
  echo "Note: copy the login.sh to binaries with (cp login.sh /usr/bin/)."
  echo "Modify the bash.bashrc file in the (/etc/) directory"
  echo "To always open the login when accessing userland"
 else
    echo "Incorrect password!"
    exit
 fi
}
dependencies
