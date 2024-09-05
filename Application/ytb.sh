#!/bin/bash

firefox &
sleep 2

sleep 0.5
# open a video link
xdotool type "youtube.com/watch?v=ktvTqknDobU" 
sleep 0.5
xdotool key Return

sleep 6

xdotool key space

sleep 2
for i in {1..5}
do
  xdotool key Right
  sleep 1
done

xdotool key ctrl+Shift+w
