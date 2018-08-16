#!/usr/bin/env bash

# This script assumes the following are installed:
# - Fish shell (brew install fish)
# - Oh-My-Fish (curl -L http://get.oh-my.fish | fish) - Themes!
# - Autojump (brew install autojump) - CLI to jump to recently used dirs
# - Bass (https://github.com/edc/bass) - Required to use NVM

# $DOTFILES_DIR = This project directory
export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Symlink: ~/dotfilesdir -> this-project-dir
ln -sfv "$DOTFILES_DIR" "$HOME/dotfilesdir"

# Git config:
# Symlink: ~/.gitconfig -> this-project-dir/git/.gitconfig
ln -sfv "$HOME/dotfilesdir/git/.gitconfig" ~

# Symlink: ~/.gitignore_global -> this-project-dir/git/.gitignore_global
ln -sfv "$HOME/dotfilesdir/git/.gitignore_global" ~

# Create fish config directory if it doens't already exists
if [ ! -d "~/.config/fish/" ]; then
    mkdir -p ~/.config/fish/
fi
sudo chmod -R a+rw $HOME/.config/fish

# Fish config:
# Symlink: ~/.config/omf/init.fish -> this-project-dir/fish/init.fish
ln -sfv "$HOME/dotfilesdir/fish/init.fish" ~/.config/omf/init.fish

# Custom fish scripts:
# Symlink: ~/.config/fish/custom/ -> this-project-dir/fish/custom/
ln -sfv "$HOME/dotfilesdir/fish/custom" ~/.config/omf/custom