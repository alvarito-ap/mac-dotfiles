sketchybar --add item spotify e \
    --set spotify \
    icon= \
    icon.y_offset=1 \
    label.drawing=off \
    label.padding_left=0 \
    label.padding_right=8 \
    icon.padding_left=8 \
    icon.padding_right=8 \
    background.padding_left=100 \
    updates=on \
    update_freq=1 \
    script="$CONFIG_DIR/plugins/spotify.sh" \
    --subscribe spotify mouse.clicked
