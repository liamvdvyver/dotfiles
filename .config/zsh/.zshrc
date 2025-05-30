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

# Git status
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info
PS1='%B%F{blue}%10~%f %F{cyan}${vcs_info_msg_0_}❯%f%b '
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats       ' %b%u%c '
zstyle ':vcs_info:git:*' actionformats ' %b|%a%u%c '

# Conda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

# Tmuxifier
eval "$(tmuxifier init -)"

# Kitty shell integration
if test -n "$KITTY_INSTALLATION_DIR"; then
    export KITTY_SHELL_INTEGRATION="enabled"
    autoload -Uz -- "$KITTY_INSTALLATION_DIR"/shell-integration/zsh/kitty-integration
    kitty-integration
    unfunction kitty-integration
fi

# FZF
source /usr/share//fzf/key-bindings.zsh
source /usr/share//fzf/completion.zsh

# Zoxide
eval "$(zoxide init zsh)"

# Setup gpg-agent
. "$XDG_CONFIG_HOME/shell/gpg-agent"

# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init - zsh)"
