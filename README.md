# dotfiles

Current macOS dotfiles aligned to this laptop.

## Layout

- `.zshenv` points Zsh at `.config/zsh`
- `.config/zsh` contains shell config only
- `.config/tmux/tmux.conf` is the canonical tmux config
- `.config/nvim` contains the current LazyVim setup
- `.config/colima/default/colima.yaml` contains the current Colima profile
- `.config/zed` contains the canonical editor settings and keymap for Zed

## Setup

Run:

```bash
./setup
```

The script installs Homebrew packages from `brew/Brewfile`, including Zed, Colima, and Docker CLI, links the repo-managed configs into `$HOME`, copies the current iTerm preference plist, and clones tmux plugins into `~/.local/share/tmux/plugins`.

## Notes

- Generated files, shell history, secrets, and LazyVim runtime data are intentionally not tracked.
- `~/.config/zsh/.p10k.zsh` is optional and loaded only if present.
