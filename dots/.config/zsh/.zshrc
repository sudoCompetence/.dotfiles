export LANG=en_US.UTF-8
bindkey -v

export ZSH=$HOME/.config/zsh
source $ZSH/.p10k.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTFILE=$ZSH/.zshist
HISTSIZE=1000
SAVEHIST=1000

# --- Completion system ---
zstyle :compinstall filename '/home/admin/.zshrc'
autoload -Uz compinit
compinit

# Better completion behavior
zmodload zsh/complist
setopt AUTO_MENU           # second TAB opens menu
setopt COMPLETE_IN_WORD
setopt MENU_COMPLETE

# Case-insensitive + fuzzy-ish matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=*'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Show completion while typing (optional)
setopt HIST_IGNORE_DUPS
bindkey '^I' expand-or-complete

# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
fpath=(~/.grok/completions/zsh $fpath)
autoload -Uz compinit && compinit -C
# <<< grok installer <<<

# aliases
source $ZSH/.alias.zsh

#  On Startup 
# Check if tmux is running and if not, start a new session
if [[ -z "$TMUX" && -z "$(tmux list-sessions 2>/dev/null)" ]]; then
    # If tmux is not running and no sessions exist, start a new session
    # tmux new-session -s Master \; send-keys "unimatrix -a -c red -f -n -l o -s 96" Enter
    tmux new-session -s Master || tmux
elif [[ -z "$TMUX" && -n "$(tmux list-sessions 2>/dev/null)" ]]; then
    # If tmux is not running but sessions exist, attach to the first session
    # tmux new-session -s Master
    tmux attach || tmux
fi
