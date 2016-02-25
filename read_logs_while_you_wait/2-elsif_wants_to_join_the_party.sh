#!/bin/bash

i=0
h=0
g=0
len=$(wc -l < ${1})

while [ $i -le $len ]
do
  CONTENT=$(sed -e "${i}!d" < ${1})
  VALUE=$(echo $CONTENT | grep -oe 'HEAD\|GET')
  if [ $VALUE ] && [ $VALUE == "HEAD" ]
  then
    h=$((h + 1))
  elif [ $VALUE ] && [ $VALUE == "GET" ]
  then
    g=$((g + 1))
  fi
  i=$((i + 1))
done

echo $h
echo $g
