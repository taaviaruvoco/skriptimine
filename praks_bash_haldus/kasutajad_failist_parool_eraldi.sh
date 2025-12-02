#!/bin/bash

#programm loeb etteantud failist välja kasutajanimed ja paroolid ning loob samade ettetantud nimedega kasutajad süsteemi

#kasutajate sisse lugemine failist

if [ $# -lt 2 ]; then #argumente sisestati liiga vähe
  echo ""
elif [ $# -gt 2 ]; then #argumente sisestati liiga palju
  echo ""
else #failinimi on kaasa antud
  kasutajad_fail=$1
  paroolid_fail=$2
  if ! [ -f $kasutajad_fail ] || ! [ -r "$kasutajad_fail" ] || ! [ -f $paroolid_fail ] || ! [ -r "$paroolid_fail" ]; then #kui faili ei eksisteeri või see ei ole loetav
    echo ""
  else #fail on olemas
    echo "Mõlemad failid on olemas"

    #kontrollime kas kasutajate ja paroolide arv on sama
    kasutajate_arv=$(wc -l < "$1")
    paroolide_arv=$(wc -l < "$2")
    if [ $kasutajate_arv -ne $paroolide_arv ]; then
      echo "Kasutajate arv ja paroolide arv ei klapi."
      exit 1
    fi

    for (( i=1; i<=$kasutajate_arv; i++ )); do #käime ühe kaupa nimed läbi ja proovime skriptiga kasutajad luua

      #kasutaja ja parooli lugemine
      kasutaja=$(sed -n "${i}p" "$kasutajad_fail")
      parool=$(sed -n "${i}p" "$paroolid_fail")
      echo "Proovitakse luua uus kasutaja $kasutaja"

      #kontrollime, kas kasutajanimi juba kasutusel; kui on olemas liigutakse järgmise kasutaja juurde
      cat /etc/passwd | grep ${kasutaja} >/dev/null 2>&1
      if [ $? -eq 0 ] ; then
        echo "$kasutaja nimeline kasutaja on juba loodud"
        echo "----------------------------------------"
        echo "----------------------------------------"
        continue
      else
        echo "$kasutaja nimeline kasutaja ei ole veel loodud"
      fi

      #kasutaja loomine
      useradd $kasutaja -m -s /bin/bash

      #tulemuse kontrollimine
      tulemus=$?
      if [ $tulemus -eq 0 ]; then
        echo "Kasutaja $kasutaja sai ilusti loodud"
        echo "----------------------------------------"
        echo "'/etc/passwd' sisu loodud kasutaja reaga: "
        cat /etc/passwd | grep $kasutaja
        echo "----------------------------------------"
        echo "Loodud kasutaja kodukaust on järgmine: "
        ls -la /home/${kasutaja}
      else
        echo "Kasutaja loomisega oli probleem"
        echo "Probleemi kood on $tulemus"
      fi
      echo "----------------------------------------"

      #kasutajale parooli määramine
      echo "Loodud kasutajale määratakse parool '$parool'"
      echo "$kasutaja:$parool" | chpasswd # määrab etteantud kasutajale parooli
      echo "/etc/shadow faili sisu"
      cat /etc/shadow | grep $kasutaja
      echo "----------------------------------------"
      echo "----------------------------------------"
    done
  fi
fi
