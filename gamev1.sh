#!/bin/bash
#BASHTD
#Author Pexie / Mavrik
#September 2020
#DC801 & 801Labs

#size of player area

#size of player area
PLAYAREA_W=10
PLAYAREA_H=20
PLAYAREA_X=30
PLAYAREA_Y=30

# color codes
RED=1
GREEN=2
YELLOW=3
BLUE=4
FUCHSIA=5
CYAN=6
WHITE=7

colors=($RED $GREEN $YELLOW $BLUE $FUCHSIA $CYAN $WHITE)

#player cord
PLAYER_X=0
PLAYER_Y=0

#exit game loop
exit=0

#Controls pieces movien
ticker() {
  echo 'bla'
}

#Player inputes
player_input () {
  draw_playfield
  read -rsn1 pmove
  case $pmove in
      w) PLAYER_Y=$(( PLAYER_Y - 1)) ;;
      a) PLAYER_X=$(( PLAYER_X - 2)) ;;
      s) PLAYER_Y=$(( PLAYER_Y + 1)) ;;
      d) PLAYER_X=$(( PLAYER_X + 2)) ;;
      e) echo "place" ;;
      t) echo $PLAYER_X ',' $PLAYER_Y;; #trouble shoot show x and y
      q) end=1 ;; #ends game
      1)  echo -e "\e[4${colors[0]};31m  \e[00m" ;;
      2)  echo -e "\e[4${colors[1]};31m  \e[00m" ;;
      3)  echo -e "\e[4${colors[2]};31m  \e[00m" ;;
      4)  echo -e "\e[4${colors[3]};31m  \e[00m" ;;
    esac
}

draw_playfield () {
  local i j x y line
clear
#rows
for ((j = 0; j < $PLAYAREA_H; j += 1)) {
  #columns
  line=()
  for ((i = 0; i < $PLAYAREA_W; i += 2 )) {
    if [[ i -eq $PLAYER_X && j -eq $PLAYER_Y ]]; then
      line+='[]'
    else
      line+='--'
    fi
  }
  echo $line

}
}

while [[ $end -eq 0 ]]; do
  player_input
done
