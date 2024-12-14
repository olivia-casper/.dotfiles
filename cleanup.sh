#!/bin/bash
# Reverses the changes made by linux.sh

# Removes the .nanorc file in the home directory
rm ~/.nanorc

# Removes the line source bashrc_custom from .bashrc
sed -i '/source ~\/.dotfiles\/etc\/bashrc_custom/d' ~/.bashrc

# Removes the .TRASH directory
rm -rf ~/.TRASH
