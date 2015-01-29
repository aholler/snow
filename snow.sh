#!/bin/bash

# Small snow ascii art
#
# Written 2011 during a boring hour by Alexander Holler.

SWIDTH=$(tput cols)
SHEIGHT=$(tput lines)

generate_snow() {
    local i
    snow[0]=""
    for i in $(seq 0 ${SWIDTH}); do
        if [ $RANDOM -gt 30000 ]; then
            snow[0]="${snow[0]}*"
        else
            snow[0]="${snow[0]} "
        fi
    done
}

move_snow() {
    for i in $(seq ${SHEIGHT} -1 0); do
        snow[$((i+1))]=${snow[$i]}
    done
}

print_snow() {
    for i in $(seq 0 ${SHEIGHT}); do
        echo -en "\033[$i;0H${snow[$i]}"
    done
}


while true ; do
    generate_snow
    print_snow
    move_snow
    sleep 0.3
done
