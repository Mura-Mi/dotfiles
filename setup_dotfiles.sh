#! /bin/bash

cd `dirname $0`

if [ ! -e ~/.vimrc ]; then
  ln -s ~/dotfiles/.vimrc ~/.vimrc
fi

rm ~/.bashrc
ln -s ~/dotfiles/.bashrc ~/.bashrc
rm ~/.bash_profile
ln -s ~/dotfiles/.bash_profile ~/.bash_profile

if [ ! -e ~/.gitconfig ]; then
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
fi
