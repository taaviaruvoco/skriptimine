#!/bin/bash

#programm loeb etteantud failist välja kasutajanimed ning loob samade ettetantud nimedega kasutajad süsteemi

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
      echo "Proovitakse luua uus kasutaja $rida"
      sh lisa_kasutaja.sh $rida
      echo "----------------------------------------"
      echo "----------------------------------------"
    done
  fi
fi
