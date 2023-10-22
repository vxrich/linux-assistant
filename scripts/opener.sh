#!/bin/bash
echo $1
DISPLAY=:0 $1 & # start app
cpid=$! # get process ID of said app
sleep 1 # give it a second to open the window (adjust to needs)
cwid=$(wmctrl -lp | grep " $cpid " | cut -d " " -f 1) # get window ID
echo $cwid
wmctrl -i -r "$cwid" -e "0,0,0,300,200" # move and resize!
