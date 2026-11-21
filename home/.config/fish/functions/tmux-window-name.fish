# Tmux Window Name Integration
# Sets tmux window name on directory change
# Requires: ofirgall/tmux-window-name tmux plugin

function tmux-window-name --on-variable PWD
    if test "$TERM_PROGRAM" = "tmux"
        if test -n "$TMUX_PLUGIN_MANAGER_PATH"
            set script "$TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py"
            if test -x "$script"
                $script &
            end
        end
    end
end
