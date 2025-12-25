# Fish shell configuration

# Disable greeting
set -g fish_greeting

# Initialize Starship prompt
starship init fish | source

# Fisher package manager will be installed on first run
# Run: curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Environment variables are in conf.d/env.fish
# Aliases are in conf.d/aliases.fish
# Custom functions are in the functions/ directory
