#!/bin/bash

#Nimi: Taavi Aru
#skript paigaldab mitteinteraktiivselt MySQL 8.0 teenuse

set -e
export DEBIAN_FRONTEND=noninteractive

#Baas
apt-get update -y
apt-get install -y curl ca-certificates lsb-release gnupg debconf-utils

#kontrollime et kas mysql juba olemas, kui ei ole siis paigaldame
if [ $(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed') -eq 0 ]; then #kui ei ole paigaldatud
# Kui MySQL puudub, siis alles paigaldame
  echo "mysql-apt-config mysql-apt-config/select-server select mysql-8.0" | debconf-set-selections
  echo "mysql-apt-config mysql-apt-config/select-tools  select Disabled"  | debconf-set-selections
  echo "mysql-apt-config mysql-apt-config/select-product select Ok"       | debconf-set-selections
  
  #määrame root kasutajale parooli
  echo "mysql-community-server mysql-community-server/root-pass password qwerty"     | debconf-set-selections
  echo "mysql-community-server mysql-community-server/re-root-pass password qwerty" | debconf-set-selections

  #krüptograafiline paroolisüsteem
  echo "mysql-community-server mysql-server/default-auth-override select Use Strong Password Encryption (RECOMMENDED)" | debconf-set-selections

  #paigaldame APT konfiguratsioonipaketi
  wget -O /tmp/mysql-apt-config_0.8.36-1_all.deb https://dev.mysql.com/get/mysql-apt-config_0.8.36-1_all.deb 
  apt-get install -y /tmp/mysql-apt-config_0.8.36-1_all.deb

  #uuendame pakette
  apt-get update -y
  apt-get install -y mysql-server

  #lubame mysql teenusel automaatselt käivituda
  systemctl enable --now mysql

  echo "Valmis: Oracle MySQL 8.0 on installidud. Root-parool: qwerty"
  mysql --version || true

fi
