#!/bin/bash
OLD_IFS="$IFS"
while read -r line; do
  IFS="|"
  ROWS=($line)
  for row in ${ROWS[@]}
  do
    echo $row
  done
done < $1
IFS="$OLD_IFS"
