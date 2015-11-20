#!/bin/bash
OLD_IFS="$IFS"
while read -r line;
do
  IFS="|"
  ROWS=$line

  MAX=()
  for (( i=0; i<3; i++));
  do
    MAX+=(-100000)
  done

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
  echo "${MAX[*]}"
done < $1
IFS="$OLD_IFS"
