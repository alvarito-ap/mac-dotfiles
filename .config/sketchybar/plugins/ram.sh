RAM_JSON=$(curl -s http://localhost:61208/api/3/mem)
USED="$(echo $RAM_JSON | jq '.used')"
GIGAS=$((${USED:0:2} - 2))
MB="${USED:2:2}"
sketchybar --set $NAME label=$(echo $GIGAS"."$MB"GB")
