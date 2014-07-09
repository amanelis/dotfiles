#!/bin/bash

echo "This will sync all ~/.dotfiles into this dir for git"
echo "y/n?"
read install

dotfiles=(
  .bash_profile
  .bashrc
  .gemrc
  .gitconfig
  .gitignore_global
  .my.cnf
  .profile
  .spring.rb
  .tmux.conf
  .vimrc
  .zshrc
  .zlogin
)

if [ "$install" == "y" ]; then
  echo "Syncing dotfiles..."
  for (( i = 0; i < ${#dotfiles[@]}; i++)) do
    cp ~/${dotfiles[$i]} ./
  done
  exit 0
elif [ "$install" == "n" ]; then
  exit 0
else
  exit 1
fi


