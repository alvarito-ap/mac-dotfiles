SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
SPACES=()

for i in "${!SPACE_ICONS[@]}"
do
  sid=$(($i+1))
  SPACES+=(space.$sid)
  sketchybar --add space space.$sid left \
             --set space.$sid associated_space=$sid \
                              icon="${SPACE_ICONS[i]}"\
                              icon.padding_left=8\
                              icon.padding_right=2\
                              padding_left=4\
                              padding_right=4\
                              label.padding_right=15\
                              icon.highlight_color=0xffa6e3a1\
                              label.color=$GREY\
                              label.highlight_color=$WHITE\
                              label.font="sketchybar-app-font:Regular:16.0"\
                              label.y_offset=-1\
                              background.color=$BACKGROUND_1\
                              background.border_color=$BACKGROUND_2\
                              background.drawing=off\
                              label.drawing=off\
                              script=$CONFIG_DIR/plugins/space.sh \
            --subscribe space.$sid mouse.clicked
done

sketchybar --add bracket spaces_bracket '/space\..*/' \
           --set         spaces_bracket background.color=$BACKGROUND_1 \
                                        background.border_color=$BACKGROUND_2 \
           --add item separator left \
           --set separator  icon=\
                            icon.font="$FONT:Heavy:16.0"\
                            padding_left=10\
                            padding_right=8\
                            label.drawing=off\
                            associated_display=active\
                            click_script='yabai -m space --create && sketchybar --trigger space_change'\
                            icon.color=$WHITE 

sketchybar --add item window_title left \
           --set window_title    script="~/.config/sketchybar/plugins/window_title.sh" \
                                 icon.drawing=off \
                                 label.font="$FONT:Bold:14.0" \
                                 background.padding_left=0 \
                                 label.color=$WHITE \
           --subscribe window_title front_app_switched
