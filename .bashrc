#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__
#(_)_.__/ \__,_|___/_| |_|_|  \___|

# ARCH DEFAULTS  ----------------------------------------------------------- {{{

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# }}}

# ALIASES ------------------------------------------------------------------ {{{

# basic commands
alias :q='exit'
alias q='exit'
alias cl='clear'

# colour
alias grep='grep --color=auto'
alias lsa='ls -A --color=auto'

# programs
alias S='sudo systemctl'
alias V='sudo nvim'
alias f='ranger --cmd=fzf_select'
alias h='htop'
alias m='ncmpcpp'
alias nb='newsboat'
alias nf='neofetch'
alias nm='neomutt'
alias p='yay'
alias pf='pfetch'
alias py='python'
alias p3='python3'
alias r='ranger'
alias s='systemctl'
alias t='tmux'
alias v='nvim'

# git
alias g='git'
alias gv='nvim +:G +:on'

# yadm
alias y='yadm'
alias yv='yadm enter nvim +:G +:on'
alias yr='yadm enter ranger'
alias yei='yadm enter $EDITOR ~/.config/i3/config'
alias yeb='yadm enter $EDITOR ~/.bashrc'
alias yep='yadm enter $EDITOR ~/.profile'
alias yex='yadm enter $EDITOR ~/.Xresources'
alias yev='yadm enter $EDITOR ~/.config/nvim/init.vim'
alias yek='yadm enter $EDITOR ~/.config/kitty/kitty.conf'

# rclone
alias rdd='rclone sync -i Drive: ~/drive'
alias rdu='rclone sync -i ~/drive Drive:'
alias rmd='rclone sync -i Mega: ~/mega'
alias rmu='rclone sync -i ~/mega Mega:'

# misc commands
alias cls='clear && source ~/.bashrc && xrdb ~/.Xresources'
alias pls='sudo $(history -p !!)'
alias pg='ps aux | grep'
alias ipp='curl https://ipinfo.io/ip && echo'
alias umm='sudo umount /media/media && sudo mount /media/media'
alias xr='xrdb .Xresources'

# making things work
alias gcalcli='gcalcli --config-folder ~/.config/gcalcli'

# }}}

# PROMPT ------------------------------------------------------------------- {{{

if [[ ${EUID} == 0 ]] ; then
    PS1='\[\e[01;31m\][\h\[\e[01;37m\] \W\[\e[01;31m\]]\$\[\e[00m\] '
else
    PS1='\[\033[01;36m\][\u@\h\[\033[01;00m\] \W\[\033[01;36m\]]\$\[\033[00m\] '
fi

# }}}

# OTHER -------------------------------------------------------------------- {{{

# load profile
. ~/.profile

# tab completion for aliases
if [ -f "/usr/share/bash-complete-alias/complete_alias" ]; then
    complete -F _complete_alias "${!BASH_ALIASES[@]}"
    source /usr/share/bash-complete-alias/complete_alias
fi

# Type directory name to cd
shopt -s autocd

# rice
pfetch

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# }}}
