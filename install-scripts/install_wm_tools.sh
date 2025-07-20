#!/usr/bin/env bash 


echo "--- making bash the default and installing autocomplete ---"

chsh -s /bin/bash

git clone --recursive https://github.com/akinomyoga/ble.sh.git
cd ble.sh
make
make install



echo "--- installing tools for i3 wm ---"

sudo apt install vim i3 i3lock suckless-tools nitrogen 


echo "--- install other apps ---"

sudo apt update && sudo apt install extrepo -y

sudo extrepo enable librewolf

sudo apt update && sudo apt install librewolf -y








