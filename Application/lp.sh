#!/bin/bash

firefox &
sleep 2

sleep 0.5
# load webpage
xdotool type "en.wikipedia.org/wiki/American_Idol" 
sleep 0.5
xdotool key Return

sleep 3

for i in {1..10}
do
  # Scroll the page down
  xdotool key space
  sleep 1
done

# Close Firefox
xdotool key ctrl+Shift+w
