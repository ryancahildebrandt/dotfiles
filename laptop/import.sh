#!/bin/bash

cp -r ~/.config/sublime-text ./.config/
#sublime backed up through PackageSync to ./sublime/

for f in $(cat file_list.txt)
do
	cp ~/$f ./$f
done

#store list of micro plugins
micro -plugin list > micro_plugins.txt

#nixos import
cp /etc/nixos/configuration.nix ./nixos/configuration.nix
cp /etc/nixos/desktop_deepin.nix ./nixos/desktop_deepin.nix
cp /etc/nixos/desktop_pantheon.nix ./nixos/desktop_pantheon.nix
cp /etc/nixos/desktop_plasma.nix ./nixos/desktop_plasma.nix
cp /etc/nixos/desktop_xfce.nix ./nixos/desktop_xfce.nix
cp /etc/nixos/fonts.nix ./nixos/fonts.nix
cp /etc/nixos/packages.nix ./nixos/packages.nix
cp /etc/nixos/system.nix ./nixos/system.nix
cp /etc/nixos/users.nix ./nixos/users.nix
cp -r /etc/nixos/packages ./nixos/