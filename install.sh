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
  .irbrc
  .my.cnf
  .profile
  .pryrc
  .spring.rb
  .tmux.conf
  .vimrc
  .zshrc
  .zlogin
)

if [ "$install" == "y" ]; then
  echo "Installing dotfiles..."
  for (( i = 0; i < ${#dotfiles[@]}; i++)) do
    mv ~/${dotfiles[$i]} ~/${dotfiles[$i]}.dotfiles.backup
    ln -s $PWD/${dotfiles[$i]} ~/${dotfiles[$i]}
  done
  exit 0
elif [ "$install" == "n" ]; then
  exit 0
else
  exit 1
fi


