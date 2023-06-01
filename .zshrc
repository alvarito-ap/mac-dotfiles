# Path to your oh-my-zsh installation.
export ZSH="/Users/alvaro/.oh-my-zsh"
ZSH_THEME=""
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# load zsh keybinding to enbale fzf on recursive search
source /opt/homebrew/Cellar/fzf/0.40.0/shell/key-bindings.zsh

# pure zsh theme load
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -U promptinit; promptinit
prompt pure

# nnn configuation
#BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
#export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

export PYENV="$HOME/.pyenv/shims"
export PATH="$HOME/.config/emacs/bin:$PYENV:$PATH"

alias python="python3"
alias pip="pip3"
alias ls="exa"
alias ll="exa -l"
alias la="exa -la"
alias vi="nvim"
alias tree="exa --tree"

alias tldrf='tldr --list | fzf --preview "tldr {1}" --preview-window=right,70% | xargs tldr '
alias gitcb='git branch --sort=-committerdate | fzf --header "Checout Recent Branch" --preview "git diff --color=always {1} | delta" --pointer="->" | xargs git checkout '
alias cdf='cd$(find * -type d | fzf --preview "exa -la {}")'

bindkey "^X\\x7f" backward-kill-line
bindkey "^ " autosuggest-accept

eval "$(zoxide init zsh)"
export BAT_THEME="Catppuccin-mocha"
