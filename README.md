# AlsaMixerFreeze

## Problem

Every application that uses microphone (Discord, Google Hangouts, Microsoft Teams, etc.) changes the current settings of alsamixer without any permission. Example:

![problem](https://user-images.githubusercontent.com/17178349/121073319-bcbf0300-c7a8-11eb-8c13-d56abf86e274.png)

## What's the solution

The `alsactl.sh` script listens `alsactl monitor` events. When an event is trigger, it means something tried to change the configuration and this script runs automatically `alsactl restore` to return the custom configuration.

### How to install
```bash
git clone https://github.com/Kafels/AlsaMixerFreeze.git
cd AlsaMixerFreeze && chmod +x ./install.sh && sudo ./install.sh
```

### How to uninstall
```bash
chmod +x ./uninstall.sh && sudo ./uninstall.sh
```

### How to pause if needed
```bash
# Pause
sudo systemctl stop alsamixer-freeze

# Start
# sudo systemctl start alsamixer-freeze
```

## Tested environment

- Ubuntu 20.04

## Unix dependencies:

- alsactl
- stdbuf
- systemctl

## Known issues

- Script dies after system suspend
