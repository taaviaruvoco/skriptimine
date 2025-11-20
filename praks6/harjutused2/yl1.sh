#!/bin/bash

numbrid=(1 2 3 4 5 6 7 8 9 10)

for number in {1..10}
  do
    if [ $number -eq 7 ]
      then
        break
    fi

    echo $number
  done

