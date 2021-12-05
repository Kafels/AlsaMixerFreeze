## Problem

Every application where uses microphone (Discord, Google Hangouts, Microsoft Teams, etc.) changes the current settings
of alsamixer without your permission. Example:

![problem](https://user-images.githubusercontent.com/17178349/121073319-bcbf0300-c7a8-11eb-8c13-d56abf86e274.png)

## What's the solution

The `alsactl.sh` script listens `alsactl monitor` events. When an event is trigger, it means something tried to change
the configuration and this script runs automatically `alsactl restore` to return the custom configuration.

### Available commands

```bash
# Install
sudo make install

# Uninstall
sudo make uninstall

# Pause
sudo make stop

# Start
sudo make start
```

## Tested environments

- Ubuntu 20.04
- Ubuntu 21.04

## Unix dependencies:

- alsactl
- stdbuf
- systemctl

## Known issues

- It stops after system suspend
- If you have multiple microphones (headset, laptop's microphone, etc.) and change from one to another, it stops