# zplug
export ZPLUG_HOME=~/.zplug
if [[ ! -d $ZPLUG_HOME ]];then
  git clone https://github.com/zplug/zplug $ZPLUG_HOME
fi

source $ZPLUG_HOME/init.zsh

zplug "dracula/zsh", as:theme
# zplug "themes/dieter", as:theme, from:oh-my-zsh

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

# Autocomp
autoload -U compinit
compinit

# Command History
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

setopt auto_cd
setopt auto_pushd
setopt nolistbeep
bindkey -e 

# less
export LESS='-g -i -M -R -W -x2'
export LESS_TERMCAP_mb=$'\E[01;31m'      # Begins blinking.
export LESS_TERMCAP_md=$'\E[01;31m'      # Begins bold.
export LESS_TERMCAP_me=$'\E[0m'          # Ends mode.
export LESS_TERMCAP_se=$'\E[0m'          # Ends standout-mode.
export LESS_TERMCAP_so=$'\E[00;47;30m'   # Begins standout-mode.
export LESS_TERMCAP_ue=$'\E[0m'          # Ends underline.
export LESS_TERMCAP_us=$'\E[01;32m'      # Begins underline.

# shell alias
alias ll='ls -l'
alias la='ls -la'
alias vir='vim -R'
alias vimr='vim -R'

alias grep='grep -n --color=auto'
alias gr='grep -r'

# alias for git
alias gti='git'
alias g='git'
alias gitalias='git config --list | grep ^alias'
