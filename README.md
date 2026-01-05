# Dotfiles

Modern macOS dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Start

```bash
# Install chezmoi
brew install chezmoi

# Initialize with this repository
chezmoi init https://github.com/YOUR_USERNAME/dotfiles.git

# Preview changes
chezmoi diff

# Apply dotfiles
chezmoi apply -v
```

## What's Included

- **Fish shell** with Tide prompt and curated plugins
- **Homebrew Bundle** for package management
- **Development tools** (Git, GitHub CLI, Docker, VSCode, Elixir)
- **Modern CLI tools** (bat, eza, ripgrep, fzf, atuin)
- **Terminal configs** (Alacritty, Ghostty, tmux)
- **macOS enhancements** (Touch ID for sudo, window management)

## Assumptions

- **macOS** - Some features are platform-specific
- **Homebrew** - Package installation via Brewfile
- **Bitwarden CLI** - Used for secrets management in templates

## Useful Commands

```bash
# Update dotfiles from repo
chezmoi update

# Edit a file and apply changes
chezmoi edit --apply ~/.config/fish/config.fish

# Add a new file to dotfiles
chezmoi add ~/.config/app/config.yml

# See what would change
chezmoi diff

# Re-run setup scripts
chezmoi apply --force

# Pull latest and apply
cd ~/.local/share/chezmoi && git pull && chezmoi apply -v
```

## Customization

1. **Fork this repository** to your own GitHub account
2. **Update personal configs**: Edit `dot_gitconfig`, `dot_Brewfile`, etc.
3. **Modify Brewfile**: Add/remove packages in `dot_Brewfile`
4. **Fish config**: Customize in `dot_config/fish/`
5. **Apply changes**: Run `chezmoi apply -v`

## License

[CC0 1.0 Universal](LICENSE) - Public Domain
