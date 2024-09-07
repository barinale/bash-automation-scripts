#!/bin/bash
# Move to the first workspace and open Visual Studio Code
wmctrl -s 0
code $1 & 
sleep 2
VISUAL_STUDIO=$(xdotool search --name "Visual Studio Code")
wmctrl -ir $VISUAL_STUDIO -t 0

# Move to the second workspace and open Microsoft Edge
wmctrl -s 1
microsoft-edge &
sleep 2
EDGE_ID=$(xdotool search --name "Microsoft Edge")
wmctrl -ir $EDGE_ID -t 1

# Move to the third workspace and open GNOME Terminal(s)
wmctrl -s 2

# Check if a second parameter is provided (for terminal count)
if [[ -n "$2" ]]; then
    count="$2"
else
    count=1
fi
if [[ $count =~ ^[0-9]+$ ]]; then
    for ((i=1; i<=count; i++)); do
        gnome-terminal & 
        sleep 2
        TERMINAL_ID=$(xdotool search --onlyvisible --classname gnome-terminal | tail -n 1)
	wmctrl -ir $TERMINAL_ID -t 2   
done
else
    echo "Please enter a valid positive integer."
fi

