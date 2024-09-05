#!/bin/bash

firefox &
sleep 2

sleep 0.5
# load a pdf from local disk
xdotool type "file:///home/tong/book.pdf" 
sleep 0.5
xdotool key Return

sleep 5

for i in {1..8}
do
  # Scroll the page down
  xdotool key space
  sleep 1
done

# Close Firefox
xdotool key ctrl+Shift+w

