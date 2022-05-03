#                    __ _ _      
#   _ __  _ __ ___  / _(_) | ___ 
#  | '_ \| '__/ _ \| |_| | |/ _ \
# _| |_) | | | (_) |  _| | |  __/
#(_) .__/|_|  \___/|_| |_|_|\___|
#  |_|                           

# Environment variables: defaults
export VISUAL=nvim
export EDITOR=$VISUAL
export BROWSER=brave
export RANGER_LOAD_DEFAULT_RC=FALSE
export TERMINAL=kitty
export QT_QPA_PLATFORMTHEME=gtk2
export CALIBRE_USE_SYSTEM_THEME=1
export PATH=~/git/scripts:$PATH
export TERM=xterm-kitty
export GPG_TTY=$(tty)
export PASSWORD_STORE_DIR=~/git/password-store
export BASH_COMPLETION_USER_FILE=/usr/share/bash-complete-alias/complete_alias
export HISTFILESIZE=-1
export LESSHISTFILE=-

# Pfetch config
export PF_INFO="ascii os kernel uptime pkgs shell wm editor palette"
export PF_COL1=""
export PF_COL2=9
export PF_COL3=6
#export PF_ASCII="linux"
