
#!/bin/bash
wmctrl -s 0
code $1 & 
sleep 2

#deplace to secound workspace
#open micrososft-edge
wmctrl -s 1
microsoft-edge &
sleep 2

#deplace to therd workspace
#open gnome-terminal

# Check if a parameter is provided
if [[ -n "$2" ]]; then
    count="$2"
else
    count=1
fi
 
wmctrl -s 2

if [[ $count =~ ^[0-9]+$ ]]; then
    for ((i=1; i<=count; i++)); do
gnome-terminal $1 & 
sleep 2
    done
else
    echo "Please enter a valid positive integer."
fi
