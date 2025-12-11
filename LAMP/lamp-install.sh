#!/bin/bash

#Nimi: Taavi Aru
#skript paigaldab mitteinteraktiivselt Apache2, PHP 7.x ja MySQL 8.0 teenused
#käivitab need ning prindib lõpus ka raporti

set -e
export DEBIAN_FRONTEND=noninteractive


  # 1) Baas
  apt-get update -y
  apt-get install -y curl ca-certificates lsb-release gnupg debconf-utils

  # 2) MySQL 8.0 (Oracle APT + preseed)

#kontrollime et kas mysql juba olemas, kui ei ole siis paigaldame
if [ $(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'ok installed') -eq 0 ]; then #kui ei ole paigaldatud
# Kui MySQL puudub, siis alles paigaldame
  echo "mysql-apt-config mysql-apt-config/select-server select mysql-8.0" | debconf-set-selections
  echo "mysql-apt-config mysql-apt-config/select-tools  select Disabled"  | debconf-set-selections
  wget -O /tmp/mysql-apt-config_0.8.36-1_all.deb https://dev.mysql.com/get/mysql-apt-config_0.8.36-1_all.deb 
  apt-get install -y /tmp/mysql-apt-config_0.8.36-1_all.deb
  apt-get update -y
  apt-get install -y mysql-server
  systemctl enable --now mysql
fi

  # 3) Apache2

#kontrollime et kas on paigaldatud apache teenus, kui ei ole siis paigaldame
if [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed') -eq 0 ]; then #kui ei ole paigaldatud
  apt-get install -y apache2
  systemctl enable --now apache2
  #— siia: index.html + info.php ümberkirjutus (nimi/kuupäev)
fi



  # 4) PHP 7.x

#kontrollime et kas php on paigaldatud, kui ei ole siis paigaldame
if [ $(dpkg-query -W -f='${Status}' php 2>/dev/null | grep -c 'ok installed') -eq 0 ]; then #kui ei ole paigaldatud
# Kui PHP 7.x puudub, siis alles paigaldame
  apt-get install -y php8.2 php8.2-cli php8.2-common php8.2-mysql libapache2-mod-php8.2 || true
  systemctl restart apache2
fi
  # 5) Raport
  echo "=== REPORT ==="
  apache2 -v | head -n1
  php -v | head -n1 || true
  mysql --version
  echo "apache active:  $(systemctl is-active apache2), enabled: $(systemctl is-enabled apache2)"
  echo "mysql  active:  $(systemctl is-active mysql),   enabled: $(systemctl is-enabled mysql)"
  echo "Files: /var/www/html/index.html , /var/www/html/info.php"
