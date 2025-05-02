#!/usr/bin/env bash

CONFIG_DIR=~/.config
BACKUP_DIR="$HOME/.config_backup_$((date +%s))"
FISH_CONFIG="$HOME/.config/fish"
NVIM_CONFIG="$HOME/.config/nvim"

echo "[*] Installing required packages..."
sudo pacman -S --needed git fish neovim curl

# omf install
if ! command -v omf &> /dev/null; then
    echo "[*] Installing oh-my-fish..."
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
fi

# backup
echo "[*] Backing up old config to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
[ -d "$FISH_CONFIG" ] && mv "$FISH_CONFIG" "$BACKUP_DIR/"
[ -d "$NVIM_CONFIG" ] && mv "$NVIM_CONFIG" "$BACKUP_DIR/"

echo "[*] Moving config files to .config"
mv ./fish "$CONFIG_DIR/"
mv ./nvim "$CONFIG_DIR/"

if command -v chsh &> /dev/null; then
    echo "[*] Setting fish as default shell"
    chsh -s /usr/bin/fish
fi

echo "[*] Installing OMF plugins and theme..."
fish -c "
omf install vcs;
omf install bass;
"

echo "[*] Setup complete. Open a new terminal or run 'fish'."

