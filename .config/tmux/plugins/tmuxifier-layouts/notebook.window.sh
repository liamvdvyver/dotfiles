new_window "notebook"

split_v
tmux resize-pane -y 40 -t 0

run_cmd "conda activate emet" 1
run_cmd "jupyter notebook" 1

run_cmd "conda activate emet" 0
run_cmd "nvim" 0

select_pane 0
