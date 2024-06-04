#!/usr/bin/bash

path=$(pwd | cut -f1)

function dependencies {

 apt install neofetch -y
 clear

 read -sp "Ingrese la password a utilizar en su login: " pass
 echo ""
 read -sp "Repita su password: " pass_validation
 echo ""
 if [ "$pass" = "$pass_validation" ] ; then

  echo $pass | shasum -a 512 | base64 > /home/.password
  pass=""
  pass_validation=""

  chmod 600 /home/.password
  chmod 700 $path/login.sh

  clear
  sleep 1

  echo "Nota: copiar el login.sh a binarios con (cp login.sh /usr/bin/)."
  echo "Modificar el archivo bash.bashrc en el directorio (/etc/)"
  echo "Para abrir siempre el login cuando acceda a userland "

 else
    echo "password incorrecta!"
    exit

 fi
}
dependencies
