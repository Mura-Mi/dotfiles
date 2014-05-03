#! /bin/bash

cd `dirname $0`

if [ ! -e ~/.vimrc ]; then
  ln -s ~/myconfig/.vimrc ~/.vimrc
fi

rm ~/.bashrc
ln -s ~/myconfig/.bashrc ~/.bashrc
rm ~/.bash_profile
ln -s ~/myconfig/.bash_profile ~/.bash_profile

if [ ! -e ~/.gitconfig ]; then
  ln -s ~/myconfig/.gitconfig ~/.gitconfig
fi
