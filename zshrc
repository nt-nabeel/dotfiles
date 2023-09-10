#!/bin/zsh
source $HOME/.config/zsh/homebrew
source $HOME/.config/zsh/environment
source $HOME/.config/zsh/aliases

fpath+=~/.zfunc
autoload -Uz compinit && compinit
