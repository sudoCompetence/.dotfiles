#!/usr/bin/env zsh

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"

if ! source $ZDOTDIR/.zshrc; then
    echo "FATAL Error: Could not source $ZDOTDIR/.zshrc"
    return 1
fi
