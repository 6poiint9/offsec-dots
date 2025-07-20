#!/usr/bin/env bash 



echo "--- installing tools for i3 wm ---"

sudo apt install i3 i3lock suckless-tools nitrogen 

echo "--- install other apps ---"

sudo apt update && sudo apt install extrepo -y

sudo extrepo enable librewolf

sudo apt update && sudo apt install librewolf -y








