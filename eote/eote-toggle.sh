#!/bin/bash
source "$HOME/.config/eote/config"
CURRENT_WALLPAPER=$(osascript -e 'tell application "Finder" to get POSIX path of (desktop picture as alias)' 2>/dev/null)

if [[ "$CURRENT_WALLPAPER" == "$NORMAL_WALLPAPER" ]]; then
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$INVERTED_WALLPAPER\""
    echo "$(date): Switched to inverted wallpaper" >> "$HOME/.config/eote/log"
else
    osascript -e "tell application \"Finder\" to set desktop picture to POSIX file \"$NORMAL_WALLPAPER\""
    echo "$(date): Switched to normal wallpaper" >> "$HOME/.config/eote/log"
fi
