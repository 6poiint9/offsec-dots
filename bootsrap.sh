#!/usr/bin/env bash

set -euo pipefail

# --- Config ---
DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/ben/of-dots"

echo "--- install stow and update system ---"
sudo apt update
sudo apt install -y stow git

# --- Clone dotfiles repo if needed ---
if [ ! -d "$DOTFILES_DIR" ]; then
  git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

# --- stow dotfiles ---
echo "--- stowing dotfiles ---"
stow .scripts
stow .config
stow zsh

# --- install bash autocompletion (ble.sh) ---
echo "--- making bash the default and installing autocomplete ---"

if [[ "$SHELL" != "/bin/bash" ]]; then
  chsh -s /bin/bash
  echo "Shell changed to bash. You may need to log out and log back in."
fi

if [ ! -d "$HOME/ble.sh" ]; then
  git clone --recursive https://github.com/akinomyoga/ble.sh.git "$HOME/ble.sh"
  cd "$HOME/ble.sh"
  make
  make install
  cd "$DOTFILES_DIR"
fi

# --- install i3 and tools ---
echo "--- installing tools for i3 wm ---"
sudo apt install -y vim i3 i3lock suckless-tools nitrogen

# --- install additional apps ---
echo "--- installing librewolf via extrepo ---"
sudo apt install -y extrepo
sudo extrepo enable librewolf
sudo apt update
sudo apt install -y librewolf

echo "--- bootstrap complete ---"

