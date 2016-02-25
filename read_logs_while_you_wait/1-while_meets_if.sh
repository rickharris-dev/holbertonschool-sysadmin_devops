#!/bin/bash

i=0
len=$(wc -l < ${1})
while [ $i -le $len ]
do
  CONTENT=$(sed -e "${i}!d" < ${1})
  VALUE=$(echo $CONTENT | grep -o HEAD)
  if [ $VALUE ]
  then
    echo $CONTENT
  fi
  i=$((i + 1))
done
