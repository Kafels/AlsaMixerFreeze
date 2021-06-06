ALSA_CONFIG_PATH=$HOME/.config/asound.state
if [ ! -f "$ALSA_CONFIG_PATH" ]; then
  echo "Storing your current configuration at '$ALSA_CONFIG_PATH'"
  alsactl -f $ALSA_CONFIG_PATH store
else
  echo "File '$ALSA_CONFIG_PATH' already exists"
fi

echo "Adding run.sh file permissions to run"
chmod +x run.sh

SYMLINK_PATH=$HOME/.local/bin/alsamixer-freeze
if [ -f "$SYMLINK_PATH" ]; then
  echo "Symlink '$SYMLINK_PATH' already exists. It's going to be recreate"
  rm $SYMLINK_PATH
fi

echo "Creating a symlink at '$SYMLINK_PATH'"
ln -s "$(dirname "$(readlink -f "$0")")/run.sh" $SYMLINK_PATH

COMMAND_NAME="alsamixer-freeze"
PROFILE_PATH=$HOME/.profile
if ! grep -wq "$COMMAND_NAME" $HOME/.profile; then
  echo "Enabling to automatically execute 'alsamixer-freeze' command after login"
  echo "# AlsaMixer Freeze" >> $PROFILE_PATH
  echo "alsamixer-freeze" >> $PROFILE_PATH
else
  echo "Command '$COMMAND_NAME' already exists in '$PROFILE_PATH'"
fi