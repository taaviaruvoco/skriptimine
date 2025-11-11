#!/bin/bash
#kasutajal palutakse valida kahe operatsioonisüsteemi vahel
#ning siis tagastatakse nende valik

osch=0
echo "1. Unix (Sun Os)"
echo "2. Linux (Red Hat)"
echo -n "Select your os choice [1 or 2]? "
read osch
if [ $osch -eq 1 ] ; then #kui kasutaja valis Unix operatsioonisüsteemi
     echo "You Pick up Unix (Sun Os)"
else #### nested if i.e. if within if ######
       if [ $osch -eq 2 ] ; then #kui kasutaja valis Linux operatsioonisüsteemi
             echo "You Pick up Linux (Red Hat)"
       else #kui kasutaja sisestas midagi muud
             echo "What you don't like Unix/Linux OS."
       fi
fi


#antud ülesannet saaks lahendada ka nii et ei kasutata sisseehitatud if lauset vaid
#kasutatakse elseif-i

# if...kas arv on 1
# elif...kas arv on 2
# else...sisestati midagi muud

