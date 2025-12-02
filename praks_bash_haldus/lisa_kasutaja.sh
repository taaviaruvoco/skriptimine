#!/bin/bash

#skript lisab sisestatud kasutajanime süsteemi

#echo "Sisesta kasutaja nimi, mida soovid luua: "
#read kasutaja
kasutaja=$1

#kontrollime, et kas sisend on õige
if [ "$#" -lt 1 ]; then #kui parameetrit ei sisestatud
    echo "Nime argument jäi sisestamata"
    exit 1
fi

if [ "$#" -gt 1 ]; then #kui sisestati mitu parameetrit
    echo "Sisestatud on rohkem kui üks parameeter!"
    exit 1
fi

#kontrollime ega kasutajanimi juba kasutusel ei ole
cat /etc/passwd | grep ${kasutaja} >/dev/null 2>&1
if [ $? -eq 0 ] ; then
    echo "$kasutaja nimeline kasutaja on juba loodud"
    exit 1
else
    echo "$kasutaja nimeline kasutaja ei ole veel loodud"
fi

#kasutaja loomise skript
useradd $kasutaja -m -s /bin/bash


#tulemuse kontrollimine
tulemus=$?

if [ $tulemus -eq 0 ]; then
  echo "Kasutaja $kasutaja sai ilusti loodud"
  echo "----------------------------------------"
  echo "'/etc/passwd' sisu loodud kasutaja reaga: "
  cat /etc/passwd | grep $kasutaja
  echo "----------------------------------------"
  echo "Loodud kasutaja kodukaust on järgmine: "
  ls -la /home/${kasutaja}
else
  echo "Kasutaja loomisega oli probleem"
  echo "Probleemi kood on $tulemus"
fi
