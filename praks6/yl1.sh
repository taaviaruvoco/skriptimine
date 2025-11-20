#!/bin/bash

#skript arvutab esimese paarisarvu summa

summa=0 # muutuja, millele hakatakse numbreid liitma

for (( i=1; i<=10; i++ )) # tsükkel mis itereerib esimesed kümme numbrit
  do
    summa=$(( summa + $i )) # liidab numbri summale juurde
  done

echo “Arvude 1-10 summa on $summa”
