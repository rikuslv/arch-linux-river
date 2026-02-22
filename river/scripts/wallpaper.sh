#!/bin/sh

# --- English: Wallpaper Directory ---
# Path to your wallpaper folder
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"

# --- English: Get Selection via Wofi ---
# List all files and let the user pick one
SELECTION=$(ls "$WALLPAPER_DIR" | wofi --dmenu --prompt "Chose background:")

# --- English: Apply Selection ---
# If the user didn't hit escape:
if [ -n "$SELECTION" ]; then
    # Kill previous wallpaper process
    pkill swaybg
    # Start new one
    riverctl spawn "swaybg -m fill -i $WALLPAPER_DIR/$SELECTION"

    # Optional: Send notification
    # notify-send "Wallpaper changed to $SELECTION"
fi
