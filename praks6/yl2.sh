#!/bin/bash

#programm mis arvutab sisestatud numbrit sisaldavate arvude summa

summa=0 #muutuja millele hakatakse arve juurde liitma
echo “Sisestage number: ”
read sisestatud
number=$sisestatud #sisestatud numbri koopia millega hakatakse tehteid tegema


while [ $number -ne 0 ] # tsükkel töötab seni kuni muutuja ´number´ ei ole 0
  do
    arv=$(( $number % 10 )) #leitakse 10ga jagamise jääk
    summa=$(( $summa + $arv )) # jääk liidetakse summale juurde
    number=$(( $number / 10 )) # leitakse täisosa 10ga jagamisel
  done

echo “Arvu $sisestatud numbrite summa on $summa”
