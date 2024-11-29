autoload -Uz compinit && compinit

# zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history
# number of commands to be saved inside of history
HISTSIZE=5000 
# file that's used to store all of command history
HISTFILE=~/.zsh_history
# must be same size as $HISTSIZE
SAVEHIST=$HISTSIZE
# erase any duplicates inside of history
HISTDUP=erase

# append new commands to the history file instead of overwrite
setopt appendhistory
# share command history across all zsh sessions
setopt sharehistory
# prevent a command from being written to the history by adding a space before it
setopt hist_ignore_space

setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_save_no_dups

# prevent any duplicates from being shown to us inside of historical search
setopt hist_find_no_dups


# completion case insensitive
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# aliases
alias ls='ls --color'
alias c='clear'

# shell integration
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward