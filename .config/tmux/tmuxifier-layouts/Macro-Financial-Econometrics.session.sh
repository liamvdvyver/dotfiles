# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/git/Macro-Financial-Econometrics"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "Macro-Financial-Econometrics"; then

    # Load a defined window layout.
    load_window "notebook"

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
