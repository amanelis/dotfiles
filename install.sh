#!/bin/bash

echo "This will over write any dot files in your current ~"
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
  echo "Installing dotfiles..."
  for (( i = 0; i < ${#dotfiles[@]}; i++)) do
      #ln -s "$PWD/${dotfiles[$i]}"
    echo "$PWD/${dotfiles[$i]} ~/${dotfiles[$i]}"
  done
  exit 0
elif [ "$install" == "n" ]; then
  exit 0
else
  exit 1
fi


