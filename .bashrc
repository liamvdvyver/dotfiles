#   _               _
#  | |__   __ _ ___| |__  _ __ ___
#  | '_ \ / _` / __| '_ \| '__/ __|
# _| |_) | (_| \__ \ | | | | | (__
#(_)_.__/ \__,_|___/_| |_|_|  \___|

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# source files
. ~/.config/shell/profile
. ~/.config/shell/aliases
. ~/.config/shell/git-prompt.sh

# prompt
if [[ ${EUID} == 0 ]] ; then
    PS1='\[\e[0m\]\W\[\e[1;31m\] \$\[\e[0m\] '
else
    PS1='\[\e[0;34m\]\W\[\e[1;36m\] $(__git_ps1 "(%s) ")\$\[\e[0m\] '
    PS2='\[\e[1;36m\]> \[\e[0m\] '
fi

# tab completion for aliases
if [ -f "/usr/share/bash-complete-alias/complete_alias" ]; then
    complete -F _complete_alias "${!BASH_ALIASES[@]}"
    source /usr/share/bash-complete-alias/complete_alias
fi

# Type directory name to cd
shopt -s autocd

# History file
export HISTFILE=$XDG_DATA_HOME/bash_history
export HISTFILESIZE=-1

# rice
pfetch
