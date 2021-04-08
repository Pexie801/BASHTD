#!/bin/bash
#BASHTD
#Author Pexie / Mavrik
#September 2020
#DC801 & 801Labs

#size of player area

#size of player area
PLAYAREA_W=10
PLAYAREA_H=18
PLAYAREA_PADDING_L=10
PLAYAREA_PADDING_R=18
PLAYAREA_LINE=$((PLAYAREA_W+PLAYAREA_PADDING_L+PLAYAREA_PADDING_R))

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

#Player inputes
player_input () {
  draw_playfield
  read -rsn1 pmove
  case $pmove in
      w) if [[ PLAYER_Y -eq 0 ]] ; then
            PLAYER_Y
          else
            PLAYER_Y=$(( PLAYER_Y - 1))
          fi ;;

      a) if [[ PLAYER_X -eq 0 ]] ; then
            PLAYER_X
          else
            PLAYER_X=$(( PLAYER_X - 2))
          fi ;;
  
      s)  if [[ PLAYER_Y -eq $(( PLAYAREA_H - 1)) ]] ; then
            PLAYER_Y
          else
            PLAYER_Y=$(( PLAYER_Y + 1))
          fi ;;

      d) #PLAYER_X=$(( PLAYER_X + 2)) 
          if [[ PLAYER_X -eq $(( PLAYAREA_W - 2 )) ]] ; then
            PLAYER_X
          else
            PLAYER_X=$(( PLAYER_X + 2))
          fi ;;
      e) echo "place" ;;
      t) echo $PLAYER_X ',' $PLAYER_Y;; #trouble shoot show x and y
      q) end=1 ;; #ends game
    esac
}

#player_move () {
 # if [[ PLAYER_Y -eq 0 ]] ; then
 # PLAYER_Y=$PLAYAREA_Y
 # else
 #PLAYER_Y=$(( PLAYER_Y - 1 ))
 # fi
#}
#COLISION
colision_player () {
    #rows
    echo "Line Width+Padding:"$PLAYAREA_LINE
    echo "(X:"$PLAYER_X "Y:"$PLAYER_Y")" #shows player's X,Y in Grid


    #columns
}
#colision_enemy () {}

#PLAY AREA CREATION
draw_title () {
    line=()

    ## First line
    for ((j = 0; j < $PLAYAREA_LINE; j += 1)) { 
    line+="=" 
    }
    echo $line
    line=()

    ## Secound Line
    TITLE_X=$(((PLAYAREA_LINE-8)/2))
    for ((j = 0; j < $TITLE_X; j += 1)) { 
    line+="=" 
    }
    echo $line"|BASHTD|"$line
    line=()

    ## Third Line
    for ((j = 0; j < $PLAYAREA_LINE; j += 1)) { 
    line+="=" 
    }
    echo $line
}

draw_playfield () {
local i j x y line
clear                   #Clears screen
#DRAW TITLE
draw_title           #Draws title


#DRAW PLAY AREA
#rows
for ((j = 0; j < $PLAYAREA_H; j += 1)) {
  #columns
  line=()               #clears line
  for ((i = 0; i < $PLAYAREA_W; i += 2 )) {
    if [[ i -eq $PLAYER_X && j -eq $PLAYER_Y ]]; then
      line+='[]'
    else
      line+='--'
    fi
  }
  echo $line

}
#TEMP
colision_player #Echoing line count with padding right now need to fix.
}

while [[ $end -eq 0 ]]; do
  player_input
done