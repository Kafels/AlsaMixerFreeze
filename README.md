# AlsaMixerFreeze

## Problem
Every application that uses microphone (Discord, Google Hangouts, Microsoft Teams, etc.) changes the current settings of alsamixer and usually starts a background noise. Example:

#### Personal configuration
![image](https://user-images.githubusercontent.com/17178349/111149298-7bcd9e80-856b-11eb-88b9-d8d8021b77a4.png)

#### After opening any application that requires microphone:
![image](https://user-images.githubusercontent.com/17178349/111149397-9869d680-856b-11eb-80bb-69b1cbeebf1e.png)

## What I did
This repository has a script called `alsactl.py` that listens `alsactl monitor` events. If any event is shooted, it means that something changed the configuration. After this, automatically executes `alsactl -f [alsactl_restore_conf_path] restore` to return the custom configuration.

## How to execute
- `alsactl -f $HOME/.config/asound.state store` (Store the custom configuration)
- `chmod +x run_in_bg.sh` (Enable shell to execute)
- `./run_in_bg.sh` (Execute in background)

## Tested environment
- Ubuntu 20.04
- Python 3.8

## Python dependencies
- os (inbuilt)
- subprocess (inbuilt)

## Unix dependencies:
- alsactl
- stdbuf

## Improvements
- Create a symlink
- Execute at system startup
