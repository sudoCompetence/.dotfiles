# navigation
alias c='clear'
alias cl='clear'

# list
alias  l='exa -l  --icons'
alias ls='exa -1  --icons'
alias ll='exa -la --icons'
alias ld='exa -lD --icons'

# packages
alias pacmani='sudo pacman -S' # install package
alias pacmanf='pacman -Ss' # install package
alias pacmans='pacman -Ss' # install package
alias pacmanr='sudo pacman -Rns' # uninstall package
alias pacmanup='sudo pacman -Syu' # update system/package/aur
alias pacmanls='pacman -Qs' # list installed package
alias pacmanlsa='pacman -Ss' # list availabe package
alias pacmanc='sudo pacman -Sc' # remove unused cache
alias pacmancc='pacman -Qtdq | sudo pacman -Rns -' # remove unused packages, also try > pacman -Qqd | pacman -Rsu --print -

alias yayi='yay -S'
alias yayf='yay -Ss'
alias yays='yay -Ss'
alias yayr='yay -Rcns'

# configs 
alias sourcezsh='source ~/.zshrc'
alias configzsh='cd;nvim .zshrc'
alias configkitty='cd ~/.config/kitty/; nvim kitty.conf'
alias confighypr='cd ~/.config/hypr/custom; nvim'
alias configtmux='cd ~/.config/tmux/; nvim tmux.conf.local'
alias confignvim='cd ~/.config/nvim/lua/; nvim'

alias cdconfig='cd ~/.config/'
alias cdconfigvi='cd ~/.config/nvim/lua/'

alias home='cd $HOME/;'
alias repos='cd $HOME/sudoCompetence/;'
alias dev='cd $HOME/sudoCompetence/dev;'
alias eccehomo='cd $HOME/sudoCompetence/ecce-homo;'
alias uni='cd $HOME/sudoCompetence/umn-cse/;'

# git
alias gitd='git --git-dir=$HOME/sudoCompetence/.dotfiles/ --work-tree=$HOME'

# programs 
alias vi='nvim'  # gui code editor
alias vif='nvim $(fzf)'
alias nvimf='nvim $(fzf)'
alias sql='sqlite3'

alias matrix='unimatrix -a -c red -f -n -l o -s 96; fastfetch'
alias mx='unimatrix -a -c red -f -n -l o -s 96; fastfetch'
alias top='btop'

# fzy (fuzzy finder)
alias ff='nvim $(fzf)'
fzs() {
  local root="${1:-.}"
  find "$root" -mindepth 1 \( -type f -o -type d \) 2>/dev/null | fzf
}

# tmux
# alias tmn='tmux new -t Master'
alias tmq='tmux kill-session'
alias tmqs='pkill -f tmux'
# alias tmn='tmux-sessionizer'
tmuxsesh() {
    tmux-sessionizer "${1:-$PWD}"
}
