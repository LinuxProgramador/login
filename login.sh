#!/bin/bash

#Login en bash para userland
#Elaborado por WhiteHack

Exit=$(ps | grep bash | cut -d'p' -f1 )
password_local=$(cat /home/.password | base64 -d | cut -f1)
user=$(whoami | cut -f1)

function login {


  clear
  neofetch
  echo -e "\033[1;33mNota: Cantidad de intentos disponibles 10"
  echo -e "\033[1;37m"
  for _ in 1 2 3 4 5 6 7 8 9 10 ; do

     read -sp "ingrese su password: " pass
     echo ""
     pass=$(echo $pass | shasum -a 512 | cut -f1)

     if [ "$pass" = "$password_local" ] ; then
        echo "acceso consedido!"
        pass = ""
        exit

     else
         echo "password incorrecta!"
     fi
     
  done
  clear
  echo "Saliendo de userland!"
  sleep 1
  kill -9 $Exit

}


function main {

   trap "clear && echo 'Opcion invalida!' && sleep 1 &&  kill -9 $Exit" 2 20

   if [ "$user" != 'root'  ] ; then
         login

   fi

}
main

