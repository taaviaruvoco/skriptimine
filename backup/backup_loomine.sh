#!/bin/bash

echo "Sisesta kataloogi nimi koos teega, millest soovid varukoopiat teha"
read sisend

echo "Sisesta kataloogi nimi koos teega, kuhu soovid varukoopiat salvestada"
read sihtkoht

echo "Luuakse kataloog varukoopiate jaoks"
mkdir $sihtkoht
sleep 3
ls -ld $sihtkoht
sleep 3

#liigutakse sisend kausta
cd $sisend
sleep 3

for filename in $(ls $sisend); do
  if [ -f $filename ]; then
    echo "$filename on tavaline fail"
  elif [ -d $filename ]; then
    echo "$filename puhul on tegemist kaustaga, luuakse varukoopia"

    #koopia tegemine
    kuupaev=$(date +"%d.%m.%Y")
    tar -c -f $filename.$kuupaev.tar $filename/
    gzip $filename.$kuupaev.tar

    #koopia liigutamine sihtkausta
    mv $filename.$kuupaev.tar.gz $sihtkoht
    sleep 3

    echo "varukoopia sai loodud"
  fi
done
