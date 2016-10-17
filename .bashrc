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

alias grep='grep -n --color=auto'
alias gr='grep -r'

alias gitalias='git config --list | grep ^alias'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# added by travis gem
[ -f /Users/mura_mi/.travis/travis.sh ] && source /Users/mura_mi/.travis/travis.sh

source ~/.git-completion.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"
