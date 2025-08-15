#!/usr/bin/env bash

set -euo pipefail

# --- Config ---
DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/6poiint9/offsec-dots.git"

echo "--- install stow and update system ---"
sudo apt update
sudo apt install -y stow git gawk make 

# --- Clone dotfiles repo if needed ---

if [ ! -d "$DOTFILES_DIR" ]; then
  git clone "$REPO_URL" "$DOTFILES_DIR"
fi

cd "$DOTFILES_DIR"

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
sudo apt install -y fastfetch vim nvim scrot i3 i3lock suckless-tools nitrogen kitty npm 

# --- install offsec tools ---
sudo apt install -y python3-pip pypy3-venv python3.13-venv odat ssh-audit enum4linux-ng /
mariadb-client freerdp3-dev hashcat seclists nmap snmp braa metasploit-framework /
smbmap  samba-common-bin enum4linux dnsenum fierce evil_winrm exploitdb ncat /
impacket-scripts httpie dirb laudanum nishang 

cd ~ && git clone https://github.com/CiscoCXSecurity/rdp-sec-check.git 

# --- install pip offsec tools ---
cd ~
mkdir -p offsec/py
python3 -m venv ~/offsec/py
source ~/offsec/py/bin/activate
pip3 install pyftpdlib uploadserver wsgidav cheroot
deactivate 


# --- symlink some nice impacket tools for global access ---
sudo ln -s /usr/share/doc/python3-impacket/examples/samrdump.py /usr/local/bin/samrdump.py
sudo ln -s /usr/share/doc/python3-impacket/examples/mssqlclient.py /usr/local/bin/mssqlclient.py 

# --- install additional apps ---
echo "--- installing librewolf via extrepo ---"
sudo apt install -y extrepo
sudo extrepo enable librewolf
sudo apt update
sudo apt install -y librewolf

#--- remove annoying kali message ---"
touch ~/.hushlogin 

# create simlynk for i3-bar 
cd /etc && sudo mv i3status.conf i3status.back && ln ~/.dotfiles/.config/i3status.conf i3status.conf

echo "--- bootstrap complete ---"

# Finalizing steps:
# () set up librewolf (background, dark mode)
# () Set up a new background pic for lightdm if needed 
# () go to $HOM$/.dotfiles and run $ stow .   

