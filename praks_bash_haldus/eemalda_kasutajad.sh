#!/bin/bash

#skript eemaldab etteantud nimed süsteemist, sisendiks on fail

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
      echo "Eemaldatakse kasutaja $rida"
      userdel -r "$rida"
      echo "----------------------------------------"
      echo "KONTROLL"
      echo "/etc/passwd faili sisu"
      cat /etc/passwd | grep "$rida"
      echo "----------------------------------------"
      echo "----------------------------------------"
    done
  fi
fi
