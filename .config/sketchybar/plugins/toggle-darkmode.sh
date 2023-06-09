case "$SENDER" in
"mouse.clicked")
    DARK_MODE_STATUS=$(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode')
    if [ "$DARK_MODE_STATUS" == "true" ]
    then
        osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'
    else
        osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
    fi
    ;;
esac
