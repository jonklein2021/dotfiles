#!/bin/zsh

### Oh-My-Zsh configuration

# Path to OMZ
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# I also like: "jonathan", "jreese", "lambda", "mgutz", "mh", "minimal",
# "mortalscumbag", "mrtazz", "simple", "wezm", "zhann"
ZSH_THEME="half-life"

# Completion Settings
HYPHEN_INSENSITIVE="true" # Make _ and - interchangeable during completion
COMPLETION_WAITING_DOTS="true" # Display red dots whilst waiting for completion

# Update Settings
zstyle ':omz:update' mode reminder # Remind me to update OMZ when it's time

# Performance
DISABLE_UNTRACKED_FILES_DIRTY="true" # Disable marking untracked files under VCS as dirty

# Plugins
plugins=(git kitty last-working-dir)

source $ZSH/oh-my-zsh.sh

### Zsh History ###

# Overriding OMZ's default history variables of:
# HISTFILE=~/.zsh_history, HISTSIZE=50000, SAVEHIST=10000
setopt APPEND_HISTORY
HISTSIZE=1000
SAVEHIST=2000

### Environment ###

# Colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Deno Config
. "$HOME/.deno/env"

### Aliases

if [ -f $HOME/.zsh_aliases ]; then
    . $HOME/.zsh_aliases
fi

### Path ###

export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"

### OS Specific Config ###

case "$OSTYPE" in
  # MacOS/OSX (Darwin kernel)
  darwin*)
    if [ -f $HOME/.zshrc.osx ]; then
      . $HOME/.zshrc.osx
      echo "OSX config loaded"
    else
      echo "Warning: OSX config not found."
    fi
    ;;
  # All other OS, assume WSL/Linux
  *)
    if [ -f $HOME/.zshrc.wsl ]; then
      . $HOME/.zshrc.wsl
      echo "WSL config loaded"
    else
      echo "Warning: WSL config not found."
    fi
    ;;
esac

