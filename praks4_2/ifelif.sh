#!/bin/bash

echo -n "Sisesta palun number 1 voi number 2: "
read number

if [ $number == 1 ]; then
        echo "Sa sisestasid number $number"
elif [ $number == 2 ]; then
        echo "Sa sisestasid number $number"
else
        echo "Tuleb sisestada number 1 voi 2 aga sa sisestasid $number"
fi
