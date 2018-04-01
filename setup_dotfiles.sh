#! /bin/bash

cd `dirname $0`

if [ ! -e ~/.vimrc ]; then
  ln -s ~/dotfiles/.vimrc ~/.vimrc
fi

if [ ! -e ~/.gitconfig ]; then
  ln -s ~/dotfiles/.gitconfig ~/.gitconfig
fi

if [ ! -e ~/.zshrc ]; then
  ln -s ~/dotfiles/.zshrc ~/.zshrc
fi

cp -r ./.sbt $HOME/.sbt
  
if [ ! -e ~/.sbtrc ]; then
  ln -s ./.sbtrc $HOME/
fi

