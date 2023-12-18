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
cp /etc/nixos/desktop.nix ./nixos/desktop.nix
cp /etc/nixos/system.nix ./nixos/system.nix
cp /etc/nixos/fonts.nix ./nixos/fonts.nix
cp /etc/nixos/users.nix ./nixos/users.nix