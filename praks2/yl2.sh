#!/bin/bash
#skript kuvab kasutajale kuupäeva ja ajaga seotud info
date +"Today is %A, %B %d, %Y"
date +"Time is %H:%M"
echo
date +"Calendar of %B %Y"
cal | tail -n 7
