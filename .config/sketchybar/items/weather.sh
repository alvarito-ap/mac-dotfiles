sketchybar --add item weather.moon q \
    --set weather.moon \
    background.color=0xffb4befe \
    background.padding_right=100 \
    icon.color=0xff181926 \
    icon.font.size=23 \
    icon.padding_left=4 \
    icon.padding_right=4 \
    label.drawing=off \
    script="$CONFIG_DIR/plugins/toggle-darkmode.sh" \
    --subscribe weather.moon mouse.clicked

sketchybar --add item weather q \
    --set weather \
    icon= \
    icon.color=0xfff38ba8 \
    label.padding_left=0 \
    update_freq=1800 \
    script="$CONFIG_DIR/plugins/weather.sh" \
    --subscribe weather system_woke
