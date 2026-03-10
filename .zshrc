#!/bin/zsh

# append to the history file, don't overwrite it
setopt APPEND_HISTORY

# history file configuration
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Aliases
if [ -f $HOME/.zsh_aliases ]; then
    . $HOME/.zsh_aliases
fi

# Path (Shared amongst machines)
export PATH="$PATH:$HOME/.local/share/nvim/mason/bin"

# Pull in OS Specific Config
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
