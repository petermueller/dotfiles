# Dotfiles

macOS dotfiles and machine setup, managed by [mise](https://mise.jdx.dev):
[`[dotfiles]`](https://mise.jdx.dev/dotfiles.html) links the config files into
place and [`mise bootstrap`](https://mise.jdx.dev/bootstrap.html) installs the
packages and runs the one-off setup. Everything is declared in
[`mise.toml`](mise.toml).

## New machine

```bash
# git comes with the Xcode Command Line Tools
xcode-select --install

# sign in to the App Store first if you want the mas: apps installed

# mise installs to ~/.local/bin
curl -fsSL https://mise.run | sh
export PATH="$HOME/.local/bin:$PATH"

git clone https://github.com/petermueller/dotfiles.git ~/dev/dotfiles
cd ~/dev/dotfiles
mise trust

mise bootstrap --dry-run   # preview
mise bootstrap             # asks for your password: /opt/homebrew, pkg installers, Touch ID for sudo, chsh to fish
```

Then, by hand:

```bash
mise run gpg-key           # imports the GPG signing key from Bitwarden (prompts for login)
```

Open a new terminal afterwards: fish is the login shell from then on.

SSH keys are not copied to disk: `SSH_AUTH_SOCK` points at Bitwarden Desktop's
SSH agent (the App Store build, declared as a `mas:` package), so turn the
agent on in Bitwarden's settings. `mise run ssh-key` still exists for a machine
where that agent is not an option.

The files are symlinks into this checkout, so keep it where it is (the
`dotfiles` alias expects `~/dev/dotfiles`). If it moves, run `mise dot apply`
again from the new location.

## What's included

- **Fish shell** with Tide prompt and curated plugins (via fisher)
- **Packages**: Homebrew formulae, casks and fonts, installed by mise itself.
  Homebrew does not need to be installed
- **Development tools** (Git, GitHub CLI, Docker, VS Code, Elixir)
- **Modern CLI tools** (bat, eza, ripgrep, fzf, atuin)
- **Terminal configs** (Alacritty, Ghostty, iTerm2, tmux)
- **macOS enhancements** (Touch ID for sudo, key bindings)

## Layout

| Path | What |
| --- | --- |
| `mise.toml` | Every dotfile entry, package and task |
| `home/` | Mirrors `$HOME`; linked into place |
| `macos/` | Files that are only linked on macOS |
| `files/` | Files that are copied once instead of linked (`gh` rewrites its own config) |
| `system/` | Root-owned system files (`/etc/pam.d/sudo_local`) |
| `vscode/` | VS Code settings, keybindings and the extension list |
| `mise-tasks/` | Setup scripts: `fisher`, `vscode-extensions`, `gpg-key`, `ssh-key` |
| `lib/` | Shell helpers the tasks share (Bitwarden login) |

## Useful commands

Run these from this directory (or anywhere with `mise -C ~/dev/dotfiles …`).

```bash
mise dot status                   # what is linked, missing or different
mise dot diff                     # what `apply` would change
mise dot apply                    # link/copy everything into place
mise dot unapply                  # remove what apply deployed

mise bootstrap status             # packages, system files, dotfiles
mise bootstrap packages apply     # install anything missing
mise bootstrap packages upgrade   # upgrade what is installed

mise tasks                        # list the setup tasks
```

## Making changes

- **Edit a dotfile**: edit it in place. It is a symlink, so the change is
  already in this repo; commit it.
- **Add a file to an app that is already linked** (anything under
  `home/.config/<app>/`): drop it in and run `mise dot apply`.
- **Add a new file or app**: put it under `home/` and add an entry to
  `[dotfiles]` in `mise.toml`. Link single files or one app's directory; never
  target `~` or `~/Library` with `symlink-each`, mise would scan all of it.
- **Add a package**: add `"brew:<formula>" = "latest"` or
  `"brew-cask:<cask>" = "latest"` to `[bootstrap.packages]`, then
  `mise bootstrap packages apply`. Deleting a line never uninstalls anything.
- **Add an App Store app**: add `"mas:<numeric id>" = "latest"`; `mas search
  <name>` prints the id.
- **Add a VS Code extension**: add its id to `vscode/extensions.txt`, then
  `mise run vscode-extensions`.

## No sync

This repo is public, so mise's dotfile sync is deliberately not set up: there
is no `mise dot origin`, nothing is tracked, and no history service runs. mise
only reads this checkout; pulling and pushing it is plain `git`.

## License

[CC0 1.0 Universal](LICENSE) - Public Domain
