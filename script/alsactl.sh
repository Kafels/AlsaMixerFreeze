#!/bin/bash

ALSAMIXER_FREEZE__OPT="/opt/alsamixer-freeze"
ALSAMIXER_FREEZE__CONFIG_PATH="$ALSAMIXER_FREEZE__OPT/asound.state"

alsactl -f $ALSAMIXER_FREEZE__CONFIG_PATH restore
while read line; do
  alsactl -f $ALSAMIXER_FREEZE__CONFIG_PATH restore
done < <(stdbuf -oL alsactl monitor)
