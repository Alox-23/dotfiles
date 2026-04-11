#!/bin/bash

# Get sink info
SINK_INFO=$(pactl get-sink-volume @DEFAULT_SINK@)
VOLUME=$(echo "$SINK_INFO" | grep -oP '\d+%' | head -1 | tr -d '%')
MUTED=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -oP '(yes|no)')

# Choose icon
if [ "$MUTED" = "yes" ] || [ "$VOLUME" -eq 0 ]; then
    ICON=" "
else
    ICON=" "
fi

# Output JSON
echo "{\"text\": \"$ICON$VOLUME%\", \"alt\": \"$VOLUME\", \"tooltip\": \"Volume: $VOLUME%\", \"class\": \"audio\"}"
