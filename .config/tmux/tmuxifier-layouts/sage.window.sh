# check if session root comes from an .session.sh file, or is defaulting to $HOME

window_root "$(if [[ -n "$session_root" ]] && [ ! "$session_root" = "$HOME" ]; then echo "$session_root"; else echo $(pwd); fi)"
echo window

new_window "sage"

split_v

tmux resize-pane -y 40 -t 0

run_cmd "sage" 1
run_cmd "nvim 'scratch.sage.py' -c 'VimuxOpenRunner'" 0

select_pane 0
