\#!/bin/bash

#programm loeb etteantud failist välja kasutajanimed ja paroolid ning loob samade ettetantud nimedega kasutajad süsteemi

#kasutajate sisse lugemine failist

if [ $# -eq 0 ]; then #kui failinime ei ole argumendiks antud
  echo ""
elif [ $# -gt 1 ]; then #argumente sisestati liiga palju
  echo ""
else #failinimi on kaasa antud
  fail=$1
  if ! [ -f $fail ] && ! [ -r "$fail" ]; then #kui faili ei eksisteeri või see ei ole loetav
    echo ""
  else #fail on olemas
    echo ""

    for rida in $(cat $fail); do #käime ühe kaupa nimed läbi ja proovime skriptiga kasutajad luua
      kasutaja=$(echo "$rida" | cut -f1 -d:)
      parool=$(echo "$rida" | cut -f2 -d:)
      echo "Proovitakse luua uus kasutaja $kasutaja"
      sh lisa_kasutaja.sh $kasutaja
      echo "----------------------------------------"
      echo "Loodud kasutajale määratakse parool '$parool'"
      echo "$rida" | chpasswd # määrab etteantud kasutajale parooli
      echo "/etc/shadow faili sisu"
      cat /etc/shadow | grep $kasutaja
      echo "----------------------------------------"
      echo "----------------------------------------"
    done
  fi
fi
