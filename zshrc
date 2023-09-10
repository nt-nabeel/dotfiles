#!/bin/zsh
source $HOME/.config/zsh/homebrew
source $HOME/.config/zsh/environment
source $HOME/.config/zsh/aliases

if [ -d ~/.config/private-config ]; then
    source ~/.config/private-config/zsh/zshrc
fi

fpath+=~/.zfunc
autoload -Uz compinit && compinit
