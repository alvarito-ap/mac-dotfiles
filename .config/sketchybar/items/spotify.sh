sketchybar --add item spot_logo center \
           --set spot_logo icon= \
                           label.drawing=off \
                           icon.color=0xff121219 \
                           background.color=0xffEDC4E5


sketchybar --add item spot center \
           --set spot update_freq=1 \
                      icon.drawing=off \
                      updates=on \
                      script="~/.config/sketchybar/plugins/spotifyIndicator.sh" \
                      background.color=0xff3C3E4F \
                      background.padding_left=0
