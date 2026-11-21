# Atuin - command history search and sync
# Press Up, or Ctrl+R to search command history

source "$HOME/.atuin/bin/env.fish"

# Only init and set up completions if installed and interactive shell
if status is-interactive && command -q atuin
  set -gx ATUIN_NOBIND "true"
  atuin init fish | source

  # fish_key_reader for proper terminal emulator key names
  bind ctrl-r _atuin_search
  bind -M insert ctrl-r _atuin_search

  # bind to alt-up
  bind alt-up _atuin_search

  atuin gen-completions --shell fish | source
end
