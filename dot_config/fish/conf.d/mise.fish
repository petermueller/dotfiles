# Mise (formerly rtx) integration for fish
# Replaces asdf functionality

if command -v mise &>/dev/null
    mise activate fish | source
end
