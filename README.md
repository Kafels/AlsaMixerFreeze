# AlsaMixerFreeze

## Problem
Every application that uses microphone (Discord, Google Hangouts, Microsoft Teams, etc.) changes the current settings of alsamixer without any permission. Example:

#### Personal configuration
![image](https://user-images.githubusercontent.com/17178349/111149298-7bcd9e80-856b-11eb-88b9-d8d8021b77a4.png)

#### After opening any application that requires microphone:
![image](https://user-images.githubusercontent.com/17178349/111149397-9869d680-856b-11eb-80bb-69b1cbeebf1e.png)

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