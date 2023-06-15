#!/bin/bash

# Path to your oh-my-zsh installation.
export ZSH="/Users/alvaro/.oh-my-zsh"
ZSH_THEME=""
plugins=(git zsh-autosuggestions zsh-syntax-highlighting vi-mode)
source $ZSH/oh-my-zsh.sh

# load zsh keybinding to enbale fzf on recursive search
source /opt/homebrew/Cellar/fzf/0.40.0/shell/key-bindings.zsh

# pure zsh theme load
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -U promptinit; promptinit
prompt pure

eval "$(zoxide init zsh)"
export BAT_THEME="Catppuccin-mocha"

alias cd="z"
alias ls="exa"
alias ll="exa -l"
alias la="exa -la"
alias tree="exa --tree"
alias gitst="git status"
alias gitaa="git add --all"
alias gitcm="git commit"
alias tmuxns="tmux new-session -s"
alias tmuxat="tmux attach -t"
alias tmuxdt="tmux detach"
alias tmuxks="tmux kill-session -t"

alias gitcb='git branch --sort=-committerdate | fzf --header "Checout Recent Branch" --preview "git diff --color=always {1} | delta" --pointer="->" | xargs git checkout '
alias cdf='cd $(fd -t d | fzf --preview "exa --tree {}")'
alias tldrf='tldr --list | fzf --preview "tldr {1}" --preview-window=right,70% | xargs tldr '

alias python="python3"
alias pip="pip3"
alias sensors="temp_sensor | monitor.py"

preview_file() {
    if [[ -d $1 ]]; then
        exa --tree $1
    else
        filename=$(basename "$1")
        extension=$(echo "$filename" | cut -d '.' -f 2)
        case "$extension" in
            jpg|jpeg|png|gif|bmp)
                catimage $1
                ;;
            *)
                bat --color=always $1
                ;;
        esac
    fi
}

openf(){
    open $(fd -t f | fzf --header "Open file" --preview-window=right,70% --preview "source ~/.zshrc && preview_file {1}") > /dev/null 2>&1
}
#alias openf='open $(fd -t f | fzf --header "Open file" --preview "preview_file {1}") > /dev/null 2>&1'


# Remove "forward-char" widgets from "ACCEPT".
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-forward-char}")
# Add "forward-char" widgets to "PARTIAL_ACCEPT".
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(vi-forward-char)
bindkey '^l' vi-forward-word
bindkey '^ ' autosuggest-accept

