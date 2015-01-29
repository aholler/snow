#!/bin/bash

# Small snow ascii art
#
# Written 2011 during a boring hour by Alexander Holler.

SWIDTH=$(tput cols)
SHEIGHT=$(tput lines)

generate_snow() {
    local i
    snow[0]=""
    for (( i=0; i<SWIDTH; i++ )) ; {
        if [ $RANDOM -gt 30000 ]; then
            snow[0]="${snow[0]}*"
        else
            snow[0]="${snow[0]} "
        fi
    }
}

move_snow() {
    local i
    for (( i=SHEIGHT; i>=0; i-- )) ; {
        snow[$((i+1))]=${snow[$i]}
    }
}

print_snow() {
    local i
    for (( i=0; i<=SHEIGHT; i++ )) ; {
        echo -en "\033[$i;0H${snow[$i]}"
    }
}


while true ; do
    generate_snow
    print_snow
    move_snow
    sleep 0.3
done
