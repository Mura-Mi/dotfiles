# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# personal aliases and functions

alias ll='ls -l'
alias la='ls -la'
alias vir='vim -R'
alias vimr='vim -R'

alias guess='nkf --guess'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
