#!/bin/bash

#echo "Sisestage number1: "
#read arv

for (( i=-10; i<=0; i++ ))
 do
    echo "Sisestage number: "
    read number
    echo "Sisestati number $number"
    if [ $number -eq 0 ]
      then
        #echo "Sisestati number 0"
        break
    fi

    if [ $number -le 0 ]
      then
        continue
    fi

    i=-10
  done
