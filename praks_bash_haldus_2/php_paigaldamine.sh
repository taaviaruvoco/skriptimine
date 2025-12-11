#!/bin/bash

# skript mis kontrollib kas PHP teenus on installitud
# ning kui ei ole siis see teenus paigaldatakse

#kontrollima kas PHP on paigaldatud
#kui väärtus on 0, siis ei ole paigaldatud
teenus=$(dpkg-query -W -f='${Status}' php8.2 2>/dev/null | grep -c 'ok installed')
echo "staatuse kood on $teenus"

#kontrollime et kas php on paigaldatud, kui ei ole siis paigaldame
if [ $teenus -eq 0 ]; then #kui ei ole paigaldatud
  echo "Php teenus ei ole paigaldatud"
  echo "Alustame teenuse paigaldamist"
  apt-get install -y php8.2 php8.2-cli php8.2-common php8.2-mysql libapache2-mod-php8.2 || true
  systemctl restart apache2
  echo "Php teenus on paigaldatud"
  which php
else #kui teenus on juba paigaldatud
  echo "Php teenus on paigaldatud"
  systemctl restart apache2
  which php
fi
