#!/usr/bin/env bash
# /* ---- 💫 High-Speed Matrix Blue Flow 💫 ---- */

# Define our high-contrast blue gradient colors
COLOR_DARK="0xff002b5b"   # Deep Navy Blue
COLOR_BLUE="0xff007fff"   # Electric Azure Blue
COLOR_CYAN="0xff00f0ff"   # Neon Cyan (The moving wave peak)

# Lower value = faster animation. 0.03 is blazing fast!
ANIMATION_SPEED=0.5

# Initial angle for the gradient rotation
ANGLE=0

# Clean up any duplicate running instances of this script to avoid racing conditions
current_pid=$$
for pid in $(pgrep -f "border-animation.sh"); do
    if [ "$pid" != "$current_pid" ]; then
        kill -9 "$pid" 2>/dev/null
    fi
done

while true; do
    # Rotate the angle forward rapidly to create the fluid moving effect
    ANGLE=$(( (ANGLE + 10) % 360 ))

    # Pass a valid, lightweight 3-color sequence that Hyprland natively loves
    hyprctl keyword general:col.active_border "${COLOR_CYAN}" "${COLOR_BLUE}" "${COLOR_DARK}" "${ANGLE}deg"

    # Sleep to pace the animation speed velocity
    sleep "$ANIMATION_SPEED"
done
