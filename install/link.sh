#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo -e "\nCreating symlinks"
echo "=============================="
for file in $( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' ) ; do
  target="$HOME/.$( basename $file ".symlink" )"
  if [ -e $target ]; then
    echo "~${target#$HOME} already exists... Skipping."
  else
    echo "Creating symlink for $file"
    ln -s $file $target
  fi
done

echo -e "\n\nInstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
  echo "Creating ~/.config"
  mkdir -p $HOME/.config
fi
for config in $DOTFILES/config/* ; do
  target=$HOME/.config/$( basename $config )
  if [ -e $target ]; then
    echo "~${target#$HOME} already exists... Skipping."
  else
    echo "Creating symlink for $config"
    ln -s $config $target
  fi
done

echo -e "\n\nInstalling to ~/.scripts"
echo "=============================="
if [ ! -d $HOME/.scripts ]; then
  echo "Creating ~/.scripts"
  mkdir -p $HOME/.scripts
fi
for script in $DOTFILES/scripts/* ; do
  target=$HOME/.scripts/$( basename $script )
  if [ -e $target ]; then
    echo "~${target#$HOME} already exists... Skipping."
  else
    echo "Creating symlink for $script"
    ln -s $script $target
  fi
done
