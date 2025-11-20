#!/bin/bash

#programm tagastab sisestatud arvule vastava vanuse kirjelduse

echo "Sisesta (oma) vanus: "
read vanus

if [ $vanus -lt 0 ] 
  then
    echo "Sisestatud vanus on negatiivne arv."
elif [ $vanus -ge 0 ] && [ $vanus -le 11 ]
  then
    echo "Olete laps"
elif [ $vanus -gt 11 ] && [ $vanus -le 18 ]
  then
    echo "Olete nooruk"
elif [ $vanus -gt 18 ] && [ $vanus -le 63 ]
  then
    echo "Olete täiskasvanu"
else
    echo "Olete seenior"
fi
