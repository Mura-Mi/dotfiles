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
eval "$(pyenv init -)"
