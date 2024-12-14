#!/bin/bash
# This script sets up Linux environment by configuring .nanorc and .bashrc.

LOG_FILE=~/linuxsetup.log

# Create/clear the log file at the beginning
echo "Linux setup script started at $(date)" > $LOG_FILE

# Check if operating system is Linux
if [[ $(uname) != "Linux" ]]; then
    echo "Error: Not running on Linux!" | tee -a $LOG_FILE
    exit 1
fi
echo "Running on Linux." | tee -a $LOG_FILE

# Create .TRASH directory if it doesn't exist
if [[ ! -d ~/.TRASH ]]; then
    mkdir ~/.TRASH
    echo ".TRASH directory created." | tee -a $LOG_FILE
else
    echo ".TRASH directory already exists." | tee -a $LOG_FILE
fi

# Backup existing .nanorc if it exists
if [[ -f ~/.nanorc ]]; then
    mv ~/.nanorc ~/.bup_nanorc
    echo "Current .nanorc file was renamed to .bup_nanorc" | tee -a $LOG_FILE
else
    echo "No existing .nanorc file found." | tee -a $LOG_FILE
fi

# Copy new nanorc configuration
cp ~/.dotfiles/etc/nanorc ~/.nanorc
echo "New .nanorc file copied from ~/.dotfiles/etc/nanorc" | tee -a $LOG_FILE

# Modify .bashrc to source bashrc_custom
if ! grep -q "source ~/.dotfiles/etc/bashrc_custom" ~/.bashrc; then
    echo "source ~/.dotfiles/etc/bashrc_custom" >> ~/.bashrc
    echo ".bashrc updated to source bashrc_custom." | tee -a $LOG_FILE
else
    echo ".bashrc already contains the source command for bashrc_custom." | tee -a $LOG_FILE
fi

# Final message
echo "Linux setup script completed successfully at $(date)" | tee -a $LOG_FILE

