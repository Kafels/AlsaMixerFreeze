## Problem  
Every application that uses a microphone (Discord, Google Hangouts, Microsoft Teams, etc.) changes the current settings  
of `alsamixer` without your permission. Example:  

![problem](https://user-images.githubusercontent.com/17178349/121073319-bcbf0300-c7a8-11eb-8c13-d56abf86e274.png)  

## What's the solution  
The `alsactl.sh` file listens to `alsactl monitor` events. When `alsactl monitor` triggers an event, it means a program has changed the configuration; therefore `alsactl.sh` will run `alsactl restore` to return to the previous configuration.

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
- If you have multiple microphones (headset, laptop microphone, etc.) and switch from one to another, it stops  
