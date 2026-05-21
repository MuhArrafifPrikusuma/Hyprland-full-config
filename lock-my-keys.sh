#!/usr/bin/env bash

# Phase 1: Force an instant hardware identity swap of Caps and Escape simultaneously
hyprctl keyword input:kb_options "caps:swapescape"

# Phase 2: Wait out JaKooLit's background layout-reset daemons
sleep 10

# Phase 3: Re-apply the clean swap right over their heads to lock it down
hyprctl keyword input:kb_options "caps:swapescape"
