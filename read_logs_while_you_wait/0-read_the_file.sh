#!/bin/bash

i=0
len=$(wc -l < ${1})
while [ $i -le $len ]
do
  sed -e "${i}!d" < ${1}
  i=$((i + 1))
done
