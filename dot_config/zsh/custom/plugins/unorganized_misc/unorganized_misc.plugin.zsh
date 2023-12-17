# Just a bunch of miscellaneous stuff that I haven't decided where to put yet
# These should be cleaned out w/ some regularity

# tmux Plugin - ofirgall/tmux-window-name
# Sets tmux window on `cd`
tmux-window-name() {
	if [[ $TERM_PROGRAM == "tmux" ]]; then
		($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &)
	fi
}


add-zsh-hook chpwd tmux-window-name
# /end ofirgall/tmux-window-name


env-export() {
	local conf_file=$1

	set -o allexport && source ${conf_file} && set +o allexport
}


eval "$(starship init zsh)"
