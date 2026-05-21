#!/usr/bin/env bash
# /* ---- 💫 Glitch-Proof Slow Blue Flow 💫 ---- */

# 1. Clear out any ghost loops first
current_pid=$$
for pid in $(pgrep -f "smooth-blue-flow.sh"); do
    if [ "$pid" != "$current_pid" ]; then
        kill -9 "$pid" 2>/dev/null
    fi
done

# 2. Inject the static blue gradient exactly ONCE so it cannot flicker
hyprctl keyword general:col.active_border "rgb(00f0ff) rgb(007fff) rgb(002b5b) 0deg" > /dev/null 2>&1

ANGLE=0

# 3. Micro-step rotation loop
while true; do
    # Increment by 1 degree for an ultra-slow, smooth crawl
    ANGLE=$(( (ANGLE + 1) % 360 ))
    
    # Use dispatch to smoothly rotate the existing gradient matrix natively
    hyprctl dispatch alterzorder "general:col.active_border" "rgb(00f0ff) rgb(007fff) rgb(002b5b) ${ANGLE}deg" > /dev/null 2>&1
    
    # 0.06 seconds provides a flawless, beautiful moving tempo
    sleep 0.06
done
