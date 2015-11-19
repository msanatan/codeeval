#!/bin/bash
MAX=( -10000 -10000 -10000 )
OLD_IFS="$IFS"
while read -r line;
do
  IFS="|"
  ROWS=$line
  for row in ${ROWS[@]};
  do
    IFS=" "
    ROW_ARR=($row)
    for i in ${!ROW_ARR[@]};
    do
      if [ "${ROW_ARR[$i]}" -ge "${MAX[$i]}" ]
      then
        MAX[$i]=${ROW_ARR[$i]}
      fi
    done
  done
  echo ${MAX}
done < $1
IFS="$OLD_IFS"
