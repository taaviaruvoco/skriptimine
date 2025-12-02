#!/bin/bash

# skript mis kontrollib kas Apache teenus on installitud
# ning kui ei ole siis see teenus paigaldatakse

#kontrollima kas Apache on paigaldatud
#kui väärtus on 0, siis ei ole paigaldatud
teenus=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c 'ok installed')
echo "staatuse kood on $apache2"

if [ $teenus -eq 0 ]; then #kui ei ole paigaldatud
  echo "Apache teenus ei ole paigaldatud"
  echo "Alustame teenuse paigaldamist"
  apt install apache2 -y #teenuse paigaldamise käsk
  echo "Apache teenus on paigaldatud"
  service apache2 start #käivitab teenuse
  service apache2 status #kuvab teenuse staatuse
else #kui teenus on juba paigaldatud
  echo "Apache teenus on paigaldatud"
  service apache2 start #käivitab teenuse
  service apache2 status #kuvab teenuse staatuse
fi
