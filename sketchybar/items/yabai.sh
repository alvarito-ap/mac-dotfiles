yabai=(
  icon.width=0
  label.width=0
  script="$CONFIG_DIR/plugins/yabai.sh"
  icon.font="$FONT:Bold:16.0"
  associated_display=active
)

sketchybar --add event window_focus            \
           --add event windows_on_spaces       \
           --add item yabai left               \
           --set yabai "${yabai[@]}"           \
           --subscribe yabai windows_on_spaces space_change
