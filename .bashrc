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
alias x='startx'

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
alias yt='ytfzf -t'
alias wp='pape -i'

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
alias vr='nvim +:Ranger'

# making things work
alias gcalcli='gcalcli --config-folder ~/.config/gcalcli'

# }}}

# PROMPT ------------------------------------------------------------------- {{{

if [[ ${EUID} == 0 ]] ; then
    PS1='\[\e[0m\]\W\[\e[1;31m\] \$\[\e[0m\] '
else
    PS1='\[\e[0;34m\]\W\[\e[1;36m\] \$\[\e[0m\] '
    PS2='\[\e[1;36m\]> \[\e[0m\] '
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

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0282828" #black
    echo -en "\e]P8928374" #darkgrey
    echo -en "\e]P1cc241d" #darkred
    echo -en "\e]P9fb4934" #red
    echo -en "\e]P298971a" #darkgreen
    echo -en "\e]PAb8bb26" #green
    echo -en "\e]P3d79921" #brown
    echo -en "\e]PBfabd2f" #yellow
    echo -en "\e]P4458588" #darkblue
    echo -en "\e]PC83a598" #blue
    echo -en "\e]P5b16286" #darkmagenta
    echo -en "\e]PDd3869b" #magenta
    echo -en "\e]P6689d6a" #darkcyan
    echo -en "\e]PE8ec07c" #cyan
    echo -en "\e]P7ebdbb2" #lightgrey
    echo -en "\e]PFebdbb2" #white
    clear #for background artifacting
fi

# }}}
