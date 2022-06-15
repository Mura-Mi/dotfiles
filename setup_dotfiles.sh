#! /bin/bash

cd `dirname $0`

if [ ! -e ~/.vimrc -o ! -L ~/.vimrc ]; then
  ln -s ~/dotfiles/.vimrc ~/.vimrc
fi

if [ ! -e ~/.gitconfig -o ! -L ~/.gitconfig ]; then
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
fi

if [ ! -e ~/.zshrc -o ! -L ~/.zshrc ]; then
  ln -s ~/dotfiles/.zshrc ~/.zshrc
fi

cp -r ./.sbt $HOME/.sbt
  
if [ ! -e ~/.sbtrc -o ! -L ~/.sbtrc ]; then
  ln -s ~/dotfiles/.sbtrc ~/.sbtrc
fi

if [ ! -e ~/Brewfile -o ! -L ~/Brewfile ]; then
  ln -s ~/dotfiles/Brewfile ~/Brewfile
fi
