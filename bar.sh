#!/bin/bash

green=#62db94
ocean=#0a131b

template="^b$green^^c$ocean^ CPU %s ^d^  Memory %s  ^b$green^^c$ocean^ %s ^d^"

cpu() {
	top -bn 1 | head | awk '/^%Cpu/ { print int($2)"%" }'
}

mem() {
	free -h | awk '/^Mem/ { print $3 }' | sed s/i//g
}

datetime() {
    date '+%a, %I:%M %p'
}

while true; do
	string=$(printf "$template" $(cpu) $(mem) "$(datetime)")
	xsetroot -name "$string" && sleep 5
done
