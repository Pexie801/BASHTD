#!/bin/bash
#BASHTD
#Author Pexie / Mavrik
#September 2020
#DC801 & 801Labs

#VARABILES
  #size of player area
  PLAYAREA_W=10
  PLAYAREA_H=18
  PLAYAREA_PADDING_L=10
  PLAYAREA_PADDING_R=18
  PLAYAREA_LINE=$((PLAYAREA_W+PLAYAREA_PADDING_L+PLAYAREA_PADDING_R))

  TEST_V=0

  #player cord
  PLAYER_X=0
  PLAYER_Y=0

  #enemy cord
  ENEMY_X=4
  ENEMY_Y=3

  #exit game loop
  exit=0

#Player inputes
player_input () {
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

      d)  if [[ PLAYER_X -eq $(( PLAYAREA_W - 2 )) ]] ; then
            PLAYER_X
          else
            PLAYER_X=$(( PLAYER_X + 2 ))
          fi ;;
      e) echo "place" ;;
      q) end=1 ;; #ends game
      *)  continue
          ;;
    esac
}
enemy_move () {
  if [[ $ENEMY_Y -eq $PLAYAREA_H ]] ; then
    ENEMY_Y=$((0))
    ENEMY_X=$(( ENEMY_X - 2 ))
  else
    ENEMY_Y=$(( ENEMY_Y + 1 ))
  fi
}

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
local i j x y line tcount
  clear                                                         # Clears screen
  draw_title                                                    # Draws title

#DRAW PLAY AREA
  #ROWS
  for ((j = 0; j < $PLAYAREA_H; j += 1)) {
    #COLUMS
    line=()                                                       # Clears line
      for ((i = 0; i < $PLAYAREA_W; i += 2 )) {
        if [[ i -eq $ENEMY_X && j -eq $ENEMY_Y ]]; then
          line+='<>'
        elif [[ i -eq $PLAYER_X && j -eq $PLAYER_Y ]]; then
          line+='[]'
        else
          line+='--'
        fi
      }
    echo $line
  }
  echo "Line Width+Padding:"$PLAYAREA_LINE
  echo "(X:"$PLAYER_X "Y:"$PLAYER_Y")"                        #shows player's X,Y in Grid 
echo $TEST_V
}

g_count () {
  sleep .5
  TEST_V=$((TEST_V + 1))
}

######################################################################################
################# Bits that run the game go here!!! ##################################
while [[ $end -eq 0 ]]; do
  #player_input                                                # Gets player input to move
  enemy_move
  draw_playfield                                              # Draws Play Field
  g_count
done