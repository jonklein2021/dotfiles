#!/bin/bash

# This script is run on startup and for before every commit.
# The purpose is to have ~/.config/ as the source of truth
# for certain files (those in SHARED_FILES), but manitain a
# read replica in the home directory

set -e

DOTFILES_DIR="${HOME}/.config"

declare -a SHARED_FILES=(
    ".vimrc"
    ".zsh_aliases"
    ".zshrc"
    ".zshrc.osx"
    ".zshrc.osx.work"
    ".zshrc.wsl"
)

for file in "${SHARED_FILES[@]}"
do
    if [[ -f "${DOTFILES_DIR}/${file}" ]]; then
        cp -v "${DOTFILES_DIR}/${file}" $HOME
    else
        echo "Warning: ${file} not found, skipping."
    fi
done

zsh -l

