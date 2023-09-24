new_window "notebook"

split_v 20

run_cmd "conda activate emet" 1
run_cmd "jupyter notebook" 1

run_cmd "conda activate emet" 0
run_cmd "nvim" 0

select_pane 0
