# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# personal aliases and functions

alias ll='ls -l'
alias la='ls -la'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
