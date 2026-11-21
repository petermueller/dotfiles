# Environment variables

# Erlang/Elixir configuration
set -gx ERL_AFLAGS "-kernel shell_history enabled"
set -gx ELIXIR_EDITOR "code"
set -gx PLUG_EDITOR "vscode://file/__FILE__:__LINE__"
set -gx NODE_EXTRA_CA_CERTS "$HOME/Library/Application Support/mkcert/rootCA.pem"

# PATH modifications
# Fish automatically deduplicates PATH entries
fish_add_path -g /usr/local/sbin
fish_add_path -g $HOME/local/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.docker/bin

eval "$(/opt/homebrew/bin/brew shellenv)"
