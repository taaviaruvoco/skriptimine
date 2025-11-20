#!/bin/bash

#programm tagastab vastavalt sisestatud kuu numbrile selle aastaaja, millesse see kuu jääb

echo "Sisestage kuu number: "
read kuu

if [ $kuu -eq 1 ] || [ $kuu -eq 2 ] || [ $kuu -eq 12 ] #sisestatud on talvekuu nr
  then
    echo "Praegu on talv"
elif [ $kuu -ge 3 ] && [ $kuu -le 5 ] #sisestatud on kevadkuu nr
  then
    echo "Praegu on kevad"
elif [ $kuu -ge 6 ] && [ $kuu -le 8 ] #sisestatud on suvekuu nr
  then
    echo "Praegu on suvi"
elif [ $kuu -ge 9 ] && [ $kuu -le 11 ] #sisestatud on sügiskuu nr
  then
    echo "Praegu on sügis"
else #sisestatud ei ole korrektne number
    echo "Sisestatud number on vale"
fi
