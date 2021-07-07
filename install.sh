ALSA_CONFIG_PATH="$HOME/.config/asound.state"
if [ ! -f "$ALSA_CONFIG_PATH" ]; then
  echo "Storing your current configuration at '$ALSA_CONFIG_PATH'"
  alsactl -f $ALSA_CONFIG_PATH store
else
  echo "File '$ALSA_CONFIG_PATH' already exists"
fi

COMMAND_NAME="alsamixer-freeze"
LOCAL_BIN_PATH="$HOME/.local/bin"
COMMAND_BIN_PATH="$LOCAL_BIN_PATH/$COMMAND_NAME"

echo "Creating '$LOCAL_BIN_PATH' if not exists"
mkdir -p $LOCAL_BIN_PATH

echo "Creating executable file at '$COMMAND_BIN_PATH'"
echo "python3 $PWD/alsactl.py >/dev/null 2>&1 &" > $COMMAND_BIN_PATH
chmod +x $COMMAND_BIN_PATH

PROFILE_PATH="$HOME/.profile"
if ! grep -wq "$COMMAND_NAME" $PROFILE_PATH; then
  echo "Enabling to automatically execute '$COMMAND_NAME' command after login"
  echo "# AlsaMixer Freeze" >> $PROFILE_PATH
  echo "alsamixer-freeze" >> $PROFILE_PATH
else
  echo "Command '$COMMAND_NAME' already exists at '$PROFILE_PATH'"
fi

source $PROFILE_PATH
echo "Done"