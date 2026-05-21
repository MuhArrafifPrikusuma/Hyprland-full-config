#!/usr/bin/env bash
# /* ---- 💫 Smooth, Slow Blue Gradient Flow 💫 ---- */

COLOR_DARK="0xff002b5b"   # Deep Navy Blue
COLOR_BLUE="0xff007fff"   # Electric Azure Blue
COLOR_CYAN="0xff00f0ff"   # Neon Cyan

# A slightly relaxed interval rate (roughly 20 updates per second)
ANIMATION_SPEED=0.08

ANGLE=0

# Loop cleaner
current_pid=$$
for pid in $(pgrep -f "border-animation.sh"); do
    if [ "$pid" != "$current_pid" ]; then
        kill -9 "$pid" 2>/dev/null
    fi
done

while true; do
    # CHANGED: Moving by only 2 degrees makes the rotation incredibly gradual and fluid
    ANGLE=$(( (ANGLE + 2) % 360 ))

    # Inject layout change silently
    hyprctl keyword general:col.active_border "${COLOR_CYAN}" "${COLOR_BLUE}" "${COLOR_DARK}" "${ANGLE}deg" > /dev/null 2>&1

    sleep "$ANIMATION_SPEED"
done
