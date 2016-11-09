# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
PATH=$PATH:$HOME/bin:$HOME/.rbenv/bin:/usr/local/share/npm/bin

eval "$(rbenv init -)"

export PATH

LANG=en_US.UTF-8

export LANG

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/$USER/.sdkman"
[[ -s "/Users/$USER/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/$USER/.sdkman/bin/sdkman-init.sh"

# SDKMAN
export JAVA_HOME="/Library/Java/JavaVirtualMachines/current/Contents/Home"
export GRADLE_HOME="/Users/userdir/.sdkman/candidates/gradle/current"
PATH=$PATH:$JAVA_HOME/bin:$GRADLE_HOME/bin

export PGDATA=/usr/local/var/postgres

# あなたの知らないlessの世界
export LESS='-g -i -M -R -W -x2'
export PAGER=less
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.
