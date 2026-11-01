# User Dotfiles

Store opt-in user configuration here. The layout is organized by destination,
but is not copied verbatim into the home directory:

- `config/<app>/` -> `~/.config/<app>/` for each explicitly selected app.
- Other destinations need their own mapping before any files are added.

`config/nvim/` and `config/ranger/` are independent Git submodules. Sway and
Waybar live directly under `config/sway/` and `config/waybar/`. Their other
dependencies and host assumptions are listed in `docs/components/graphical-session/`.
Do not copy this README into the home directory.

Apply files individually after reviewing the diff against the target. Keep
machine-specific values in `hosts/` rather than hardcoding them in shared
dotfiles. No dotfile deployment script is implemented yet.

Do not copy the entire existing home directory here. Exclude browser profiles,
databases, caches, runtime state, backups, and secrets.
