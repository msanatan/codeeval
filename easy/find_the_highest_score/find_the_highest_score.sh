#!/bin/bash
OLD_IFS="$IFS"
while read line || [ -n "$line" ];
do
  IFS="|"
  ROWS=$line
  MAX=()

  for row in ${ROWS[@]};
  do
    IFS=" "
    ROW_ARR=($row)

    if [ "${#MAX[@]}" -lt "${#ROW_ARR[@]}" ]
    then
      for (( i=0; i<${#ROW_ARR[@]}; i++));
      do
        MAX+=(-100000)
      done
    fi

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
