# AlsaMixerFreeze

## Problem
Every application that uses microphone (Discord, Google Hangouts, Microsoft Teams, etc.) changes the current settings of alsamixer without any permission. Example:

![problem](https://user-images.githubusercontent.com/17178349/121073319-bcbf0300-c7a8-11eb-8c13-d56abf86e274.png)

## What's the solution
This repository has a script called `alsactl.py` that listens `alsactl monitor` events. If any event is fired, it means something tried to changed the configuration. After this, automatically executes `alsactl restore` to return the custom configuration.

## How to setup
```bash
# Cloning the repository and running install.sh script
git clone https://github.com/Kafels/AlsaMixerFreeze.git && cd AlsaMixerFreeze
chmod +x ./install.sh && ./install.sh

# Run only at first time
alsamixer-freeze
```

## Tested environment
- Ubuntu 20.04
- Python 3.8

## Python dependencies
- os (inbuilt)
- subprocess (inbuilt)

## Unix dependencies:
- alsactl
- stdbuf

## Known issues
- Script dies after system suspend
