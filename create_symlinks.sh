#!/bin/bash

# Create the nvim and bat directories if they do not exist
mkdir -p ~/.config/nvim
mkdir -p ~/.config/bat

ln -s ~/github/dotfiles/nvim/* ~/.config/nvim/
ln -s ~/github/dotfiles/bat/* ~/.config/bat/
ln -s ~/github/dotfiles/starship/starship.toml ~/.config/starship.toml

echo "Symlinks created successfully!"

