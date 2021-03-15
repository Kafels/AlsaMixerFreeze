#!/usr/bin/env bash
python3 "$(dirname "$(readlink -f "$0")")/alsactl.py" >/dev/null 2>&1 &
