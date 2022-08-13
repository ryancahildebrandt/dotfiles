#!/bin/bash

cp -r ~/.config/sublime-text ./config/
#sublime backed up through PackageSync to ./sublime/

for f in $(cat file_list.txt)
do
	cp ~/$f ./$f
done



