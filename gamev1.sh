#!/bin/bash
#BASHTD
#Author Pexie / Mavrik
#September 2020
#DC801 & 801Labs

#generates the map
#Grid Var
columns=24
rows=6

i=0
c=0

#player cord
x=0
y=0

# Game things
LINE='|' # Builds the line of the text file
END=0 # to break game loop
while [[ $end -eq 0 ]]; do
#DRAWS GAME MAP
echo $x ',' $y>map.txt
until [ $i -gt $rows ]; do #Generates the full row, by row
  until [ $c -gt $columns ]; do  #Generates the cells on each row i.e. Columns
    if [[ $i -eq 0 ]] #Top line of grid
    then
      LINE+='_'
    elif [[ $i -eq $rows ]] #Bottom line of grid
    then
      LINE+='='
    else
      LINE+='-'
  fi
    c=$(( c + 1 ))
  done

  LINE+='|'
  echo $LINE>>map.txt
  LINE='|'
  i=$(( i + 1 ))
  c=0 #reset counter c to 0 for new line
done

#player controlls
read -rsn1 pmove
case $pmove in
    w) y=$(( y + 1)) ;;
    a) x=$(( x - 1)) ;;
    s) y=$(( y - 1)) ;;
    d) x=$(( x + 1)) ;;
    e) echo "place" ;;
    t) echo $x ',' $y;; #trouble shoot show x and y
    q) end=1 ;; #ends game
  esac
done

#| |________________________
#|-------------------------|
#|-------------------------|
#|-------------------------|
#|-------------------------|
#|-------------------------|
#|=======================| |
