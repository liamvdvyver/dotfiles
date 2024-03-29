new_window "nvim"

run_cmd "conda activate emet"
run_cmd "nvim"

new_window "notebook"

run_cmd "conda activate emet"
run_cmd "jupyter notebook"

select_window "notebook"

select_window "nvim"
