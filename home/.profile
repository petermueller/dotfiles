# For compatibility with things that aren't intelligent about PATH, and are explicitly using /bin/sh, e.g. Xcode

# asdf-vm
# . $HOME/.asdf/asdf.sh

# mise (alternative to asdf). This file is read by non-interactive sh, where
# `mise activate` has no prompt to hook into, so put mise and its shims on PATH
# instead (this is what `mise activate bash --shims` prints).
export PATH="$HOME/.local/share/mise/shims:$HOME/.local/bin:$PATH"

# alias docker="limactl shell default"

# Only present when atuin came from its own installer rather than a package
if [ -f "$HOME/.atuin/bin/env" ]; then
  . "$HOME/.atuin/bin/env"
fi
