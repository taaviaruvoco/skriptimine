#!/bin/bash

#Nimi: Taavi Aru
#Skripti ülesanne: väljastab kujundi milles on sisestatud arv ridu
#ning milles esimeses reas on sisestatud arv tärne ning igas järgnevas
#reas on üks tärn vähem

#kasutajalt küsitakse arv
echo "Sisesta ridade arv: "
read read #kasutaja sisestatud arv salvestatakse muutujaks

#tehakse tsüklit mitu korda läbi kus kõige ülemises reas on sisestatud arvule vastavalt tärne
#ning igas järgnevas reas siis üks vähem kuni viimase reani, milles on üks tärn
for (( i=1; i<=$read; i++ )) #teeb ridade arvuga võrdse arvu tsükleid läbi
  do
    rida=""
    for (( j=$read; j>=$i; j-- )) # teeb rea pikkusega võrdse arvu tsükleid läbi
      do
        rida+="*"
      done
    echo "$rida" #prindib loodud tärnide rea
  done
