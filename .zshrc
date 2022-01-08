# Path to your oh-my-zsh configuration.
ZSH=$HOME/Repos/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="candy"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git python extract golang vi-mode)

source $ZSH/oh-my-zsh.sh

bindkey -M isearch '^R' history-incremental-search-backward
bindkey -M isearch '^S' history-incremental-search-forward
bindkey -M vicmd '^R' history-incremental-search-backward
bindkey -M vicmd '^S' history-incremental-search-forward

export EDITOR=nvim
export LS_COLORS=$LS_COLORS:'*.pyc=0;30'
export PROJECT_HOME=$HOME/Projects
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$HOME/.local/bin:/usr/local/opt/python/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$GOPATH/bin:$GOROOT/bin:./node_modules/.bin:$PATH

#export PIPENV_VENV_IN_PROJECT=1

# Docker daemon host
export DOCKER_HOST=127.0.0.1:2375

# This fixes the ":checkhealth" command in neovim to detach the virtualenv without any warnings
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# Setup nvm environment
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_OPTIONS=--max_old_space_size=8192

bindkey -v

if [ -e "${HOME}/.iterm2_shell_integration.zsh" ]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
fi

# MacOS brew installed python paths
BREW_PYTHON_VERSION=3.10
BREW_PYTHON="/usr/local/opt/python@$BREW_PYTHON_VERSION"
if [ -e ${BREW_PYTHON} ]; then
  export PATH=$BREW_PYTHON/Frameworks/Python.framework/Versions/$BREW_PYTHON_VERSION/bin:$PATH
  export PATH=$BREW_PYTHON/bin:$PATH
fi

# Tilix gnome terminal emulator
#
# It might require:
#   sudo ln -s /etc/profile.d/vte-2.91.sh /etc/profile.d/vte.sh
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi
