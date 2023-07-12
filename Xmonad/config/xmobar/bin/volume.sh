#!/bin/bash

volume=$(pamixer --get-volume)

if [ "$volume" -ge 0 ] && [ "$volume" -le 20 ]; then
    icon=""
    color="gray"
elif [ "$volume" -gt 20 ] && [ "$volume" -le 50 ]; then
    icon="奔"
    color="orange"
elif [ "$volume" -gt 50 ] && [ "$volume" -le 70 ]; then
    icon="墳"
    color="darkorange"
else
    icon=""
    color="red"
fi

echo -n "<fc=$color>$icon</fc> $volume%"
