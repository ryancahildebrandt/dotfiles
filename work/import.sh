#!/bin/bash

cp -r ~/.config/nvim ./.config/
cp -r ~/.config/sublime-text ./.config/
#sublime backed up through PackageSync to ./sublime/

while read -r f; do
	cp "$HOME/$f" "./$f"
done <"file_list.txt"

#store list of micro plugins
micro -plugin list > micro_plugins.txt
