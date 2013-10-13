# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin:$HOME/.rbenv/bin:/usr/local/share/npm/bin

eval "$(rbenv init -)"

export PATH

LANG=en_US.UTF-8

export LANG

