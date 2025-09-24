#!/usr/bin/env bash

set -euo pipefail

# --- Config ---
DOTFILES_DIR="$HOME/.dotfiles"
REPO_URL="https://github.com/6poiint9/offsec-dots.git"

echo "--- install stow and update system ---"
sudo apt update
sudo apt install -y stow git gawk make 

# --- install i3 and tools ---
echo "--- installing tools for i3 wm ---"
sudo apt install -y fastfetch vim neovim scrot i3 i3lock suckless-tools nitrogen kitty npm cifs-utils 

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

git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
echo 'source -- ~/.local/share/blesh/ble.sh' >> ~/.bashrc

# --- install offsec tools ---
sudo apt install -y nmap python3-pip pypy3-venv python3.13-venv odat ssh-audit enum4linux-ng \
mariadb-client freerdp3-dev hashcat seclists nmap snmp braa metasploit-framework \
smbmap  samba-common-bin enum4linux dnsenum fierce evil-winrm exploitdb ncat \
impacket-scripts httpie dirb laudanum nishang hashid cewl html2text dislocker \
netexec krb5-user ligolo-ng gobuster cifs-utils evolution sqsh dbeaver medusa \
crackmapexec responder crowbar ettercap-common smtp-user-enum chisel ettercap-graphical \
hydra laudanum nginx nginx-common proxychains4 wireshark wireshark-common libwiretap15 \
tshark ssh-audit libreoffice libreoffice-gtk4 john

echo "--- Installed offsec tools! ---" 
# --- install pip offsec tools ---
cd ~
mkdir -p offsec/py
python3 -m venv ~/offsec/py
source ~/offsec/py/bin/activate
pip3 install pyftpdlib uploadserver wsgidav cheroot 
deactivate 

echo "--- installed pip tools ---"
# --- install github tools ---
cd ~
mkdir tools && cd tools
git clone https://github.com/CiscoCXSecurity/rdp-sec-check.git 
git clone https://github.com/dirkjanm/PKINITtools.git && cd PKINITtools
source ~/offsec/py/bin/activate
pip3 install -r requirements.txt
deactivate 
cd ..
git clone https://github.com/dirkjanm/krbrelayx.git
git clone https://github.com/ShutdownRepo/pywhisker.git
git clone https://github.com/CiscoCXSecurity/rdp-sec-check.git
git clone https://github.com/projectdiscovery/subfinder.git
git clone https://github.com/TheRook/subbrute.git
git clone https://github.com/0xZDH/o365spray.git
git clone https://github.com/lgandx/PCredz.git
git clone https://github.com/urbanadventurer/username-anarchy.git

echo "--- installed GitHub tools ---"
# --- install executables to transfer ---
cd ~
mkdir ~/transfer && cd  ~/transfer
wget -O ~/transfer/winPEAS64.exe https://github.com/peass-ng/PEASS-ng/releases/download/20250904-27f4363e/winPEASx64.exe
wget -O ~/transfer/winPEAS84.exe https://github.com/peass-ng/PEASS-ng/releases/download/20250904-27f4363e/winPEASx86.exe
wget -O ~/transfer/linpeas.sh https://github.com/peass-ng/PEASS-ng/releases/download/20250904-27f4363e/linpeas_linux_amd64
wget https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20220919/mimikatz_trunk.zip
wget -O ~/transfer/LaZagne.exe https://github.com/AlessandroZ/LaZagne/releases/download/v2.4.7/LaZagne.exe
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_agent_0.8.2_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_proxy_0.8.2_linux_amd64.tar.gz
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_agent_0.8.2_windows_amd64.zip
wget https://github.com/nicocha30/ligolo-ng/releases/download/v0.8.2/ligolo-ng_proxy_0.8.2_windows_amd64.zip

echo "--- installed tools to transfer---"
# --- install librewolf browser ---
cd
sudo apt install -y extrepo
sudo extrepo enable librewolf
sudo apt update
sudo apt install -y librewolf

echo "--- installed browser ---"
#--- remove annoying kali message ---"
touch ~/.hushlogin 
# Remove random dirs 
rmdir Music Public Videos Templates 2>/dev/null 

# create simlynk for i3-bar 
cd /etc && sudo mv i3status.conf i3status.back && ln ~/.dotfiles/.config/i3status.conf i3status.conf

echo "--- bootstrap complete ---"


info "Bootstrap complete!!! Final manual steps:"
echo "1. Log out and log back in if shell was changed."
echo "2. Run: cd ~/.dotfiles && stow .


