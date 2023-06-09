case "$SENDER" in
"mouse.clicked")
    osascript -e 'tell application "Spotify" to next track'
    ;;
esac
