#!/bin/bash

text="koer;kass;hiir"
IFS=';'

for x in $text
  do
    echo $x
  done
