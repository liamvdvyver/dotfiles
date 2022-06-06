#           _              
#   _______| |__  _ __ ___ 
#  |_  / __| '_ \| '__/ __|
# _ / /\__ \ | | | | | (__ 
#(_)___|___/_| |_|_|  \___|
                          
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Lines configured by zsh-newuser-install
setopt autocd
bindkey -v

# Source aliases
source ~/.config/shell/aliases

# Set prompt
PS1='%B%F{blue}%1~%f %F{cyan}❯%f%b '
PS2='%B%F{blue}→%f%b '

# Configure history
HISTFILE=~/.local/share/histfile
HISTSIZE=10000
SAVEHIST=10000

# Enable completion
zmodload zsh/complist
autoload -Uz compinit
compinit

# Complete on hidden files, with menu, case insensitive
_comp_options+=(globdots)
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Fix backspace bug when switching modes
bindkey "^?" backward-delete-char

# Edit line in vim
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# Colours
autoload -U colors
colors

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-you-should-use/you-should-use.plugin.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh

# Rice
pfetch
