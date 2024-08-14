#!/bin/bash

netcat_command="nc -l -u -p 9999"
while x=x
do
  command=$(head -c 1 <($netcat_command))
  pkill -f "$netcat_command"
  echo Got command $command
  if [[ $command == "n" ]]
  then
    echo "Next song"
    xdotool key XF86AudioNext
  elif [[ $command == "p" ]]
  then
    echo "Previous song"
    xdotool key XF86AudioPrev 
  elif [[ $command == "P" ]]
  then
    echo "Play/Pause"
    xdotool key XF86AudioPlay  
  else
    echo "Unknown Command"
  fi
done
