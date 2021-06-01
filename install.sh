echo "Storing your current configuration at '$HOME/.config/asound.state'"
alsactl -f $HOME/.config/asound.state store

echo "Adding run.sh permissions to run"
chmod +x run.sh

echo "Creating a symlink at '$HOME/.local/bin/alsamixer-freeze'"
ln -s "$(dirname "$(readlink -f "$0")")/run.sh" $HOME/.local/bin/alsamixer-freeze

echo "Enabling to automatically executes 'alsamixer-freeze' command after login"
echo "# AlsaMixer Freeze" >> $HOME/.profile
echo "alsamixer-freeze" >> $HOME/.profile