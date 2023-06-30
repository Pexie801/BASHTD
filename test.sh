#!/bin/bash
#BASHTD
#Author Pexie
#july 2023
#DC801

#VARABILES
  #size of player area
  AREA_W=$(tput cols)           #Gets width of terminal window
  AREA_H=$(tput lines)          #Gets hieght of terminal window
  PLAYAREA_W=20
  PLAYAREA_H=9          
  PLAYAREA_PADDING=10


draw_title () {
    #VARS
    TITLE="|BOXXIN|"
    TITLE_LENGTH=(${#TITLE})
    AUTHOR="PEXIE"
    line=()
    TITLE_X=$((PLAYAREA_W/2-(TITLE_LENGTH/2)))

    ## second line
    for ((j = 0; j < $TITLE_X; j += 1)) { 
        line+="=" 
    }
     ## Third Line
    echo $line$TITLE$line
    line=()
    for ((j = 0; j < $PLAYAREA_W; j += 1)) { 
        line+="=" 
    }
    echo $line
    line=()
}
draw_playfield () {
    TEST1="bob"
}
draw_footer () {
    TEST2="bob"
}

draw_title








## XX = Box start
## OO = Box End
## WW = Wall
## PP = Player start\
## -- = blank play area
level_0 () {
----------
----PP----
----XX----
----OO----
----------
}
level_1 () {
PP--------
----------
----XX----
----WW----
--------OO
}