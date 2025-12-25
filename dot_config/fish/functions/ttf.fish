# Test Till Fail
# Runs mix test repeatedly until it fails

function ttf
    mix test $argv
    while test $status -eq 0
        mix test $argv
    end
end

# Test Till Fail with Clear
# Runs mix test repeatedly until it fails, clearing tmux history between runs

function ttf_clear
    mix test $argv
    while test $status -eq 0
        clear && tmux clear-history
        mix test $argv
    end
end
