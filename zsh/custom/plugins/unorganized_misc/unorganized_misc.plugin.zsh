# Just a bunch of miscellaneous stuff that I haven't decided where to put yet
# These should be cleaned out w/ some regularity

# tmux Plugin - ofirgall/tmux-window-name
# Sets tmux window on `cd`
tmux-window-name() {
	($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
}

add-zsh-hook chpwd tmux-window-name
# /end ofirgall/tmux-window-name
