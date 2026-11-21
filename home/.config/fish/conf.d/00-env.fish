# Environment variables

# Erlang/Elixir configuration
set -gx ERL_AFLAGS "-kernel shell_history enabled"
set -gx ELIXIR_EDITOR "code"
set -gx PLUG_EDITOR "vscode://file/__FILE__:__LINE__"
set -gx NODE_EXTRA_CA_CERTS "$HOME/Library/Application Support/mkcert/rootCA.pem"

# SSH keys are served by Bitwarden Desktop's SSH agent (App Store build)
set -gx SSH_AUTH_SOCK "$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"

# PATH modifications
# Fish automatically deduplicates PATH entries
fish_add_path -g /usr/local/sbin
fish_add_path -g $HOME/local/bin
fish_add_path -g $HOME/.local/bin
fish_add_path -g $HOME/.docker/bin

# Homebrew prefix. mise installs the formulae/casks itself (see mise.toml), so
# the `brew` binary is optional: use its shellenv when present, otherwise just
# put the prefix on PATH.
if test -x /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
else if test -d /opt/homebrew
    fish_add_path -g /opt/homebrew/bin /opt/homebrew/sbin
end
