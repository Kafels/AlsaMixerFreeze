#!/bin/bash

ALSAMIXER_FREEZE__OPT="/opt/alsamixer-freeze"
ALSAMIXER_FREEZE__SERVICE_NAME="alsamixer-freeze.service"

echo "Removing folder '$ALSAMIXER_FREEZE__OPT'"
rm -rf $ALSAMIXER_FREEZE__OPT

echo "Removing '$ALSAMIXER_FREEZE__SERVICE_NAME'"
systemctl stop $ALSAMIXER_FREEZE__SERVICE_NAME
systemctl disable $ALSAMIXER_FREEZE__SERVICE_NAME
rm /etc/systemd/system/$ALSAMIXER_FREEZE__SERVICE_NAME
systemctl daemon-reload
systemctl reset-failed
