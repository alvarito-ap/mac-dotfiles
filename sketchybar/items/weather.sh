sketchybar --add item weather.moon q \
    --set weather.moon \
    background.color=0xffb4befe \
    background.padding_right=100 \
    icon.color=0xff181926 \
    icon.padding_left=6 \
    icon.padding_right=6 \
    label.drawing=off \
    --subscribe weather.moon mouse.clicked

sketchybar --add item weather q \
    --set weather \
    icon= \
    icon.color=0xfff5bde6 \
    update_freq=1800 \
    script="$CONFIG_DIR/plugins/weather.sh" \
    --subscribe weather system_woke
