COMMAND_NAME="alsamixer-freeze"
LOCAL_BIN_PATH="$HOME/.local/bin"
COMMAND_BIN_PATH="$LOCAL_BIN_PATH/$COMMAND_NAME"

# Removing the alsamixer-freeze script
if [ -f "$COMMAND_BIN_PATH" ]; then
    echo "Removing $COMMAND_BIN_PATH"
    rm "$COMMAND_BIN_PATH"
fi

PROFILE_PATH="$HOME/.profile"

if [ -f "$PROFILE_PATH" ]; then
    echo "Removing command from $PROFILE_PATH"
    sed -i '/^# AlsaMixer Freeze\|^alsamixer-freeze/d' "$PROFILE_PATH"
fi

read -r -p "Do you want to reboot the system for changes to apply? [y/N]" choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Rebooting..."
    sudo reboot -f
fi



