
# Max number of characters so it fits nicely to the right of the notch
# MAY NOT WORK WITH NON-ENGLISH CHARACTERS
MAX_LENGTH=35

# Logic starts here, do not modify
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))
# Spotify JSON $INFO comes in malformed, line below sanitizes it
SPOTIFY_JSON="$INFO"

update_track() {
    RUNNING=$(osascript -e 'if application "Spotify" is running then return 0')
    if [ "$RUNNING" == "" ]; then 
        # spotify not running
        echo "not running"
        sketchybar --set $NAME icon.color=0xfff38ba8  #label.drawing=no
        return
    fi
    PLAYING=$(osascript -e 'if application "Spotify" is running then tell application "Spotify" to get player state')
    if [ "$PLAYING" != "playing" ]; then
        sketchybar --set $NAME icon.color=0xfff9e2af  #label.drawing=no
        return
    fi

    PLAYER_STATE=$PLAYING
    if [ $PLAYER_STATE = "playing" ]; then
        TRACK="$(osascript -e 'tell application "Spotify" to get name of current track')"
        ARTIST="$(osascript -e 'tell application "Spotify" to get artist of current track')"

        # Calculations so it fits nicely
        TRACK_LENGTH=${#TRACK}
        ARTIST_LENGTH=${#ARTIST}

        if [ $((TRACK_LENGTH + ARTIST_LENGTH)) -gt $MAX_LENGTH ]; then
            # If the total length exceeds the max
            if [ $TRACK_LENGTH -gt $HALF_LENGTH ] && [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
                # If both the track and artist are too long, cut both at half length - 1

                # If MAX_LENGTH is odd, HALF_LENGTH is calculated with an extra space, so give it an extra char
                TRACK="${TRACK:0:$((MAX_LENGTH % 2 == 0 ? HALF_LENGTH - 2 : HALF_LENGTH - 1))}…"
                ARTIST="${ARTIST:0:$((HALF_LENGTH - 2))}…"

            elif [ $TRACK_LENGTH -gt $HALF_LENGTH ]; then
                # Else if only the track is too long, cut it by the difference of the max length and artist length
                TRACK="${TRACK:0:$((MAX_LENGTH - ARTIST_LENGTH - 1))}…"
            elif [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
                ARTIST="${ARTIST:0:$((MAX_LENGTH - TRACK_LENGTH - 1))}…"
            fi
        fi
        sketchybar --set $NAME label="${TRACK}  ${ARTIST}" label.drawing=yes icon.color=0xffa6da95

    elif [ $PLAYER_STATE = "Paused" ]; then
        sketchybar --set $NAME icon.color=0xffeed49f
    elif [ $PLAYER_STATE = "Stopped" ]; then
        sketchybar --set $NAME icon.color=0xffeed49f label.drawing=no
    else
        sketchybar --set $NAME icon.color=0xffeed49f
    fi
}

case "$SENDER" in
"mouse.clicked")
    osascript -e 'tell application "Spotify" to playpause'
    ;;
*)
    update_track
    ;;
esac

