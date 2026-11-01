# User Dotfiles

Store opt-in user configuration here. The layout is organized by destination,
but is not copied verbatim into the home directory:

- `config/<app>/` -> `~/.config/<app>/` for each explicitly selected app.
- Other destinations need their own mapping before any files are added.

`config/nvim/` and `config/ranger/` are independent Git submodules. Other
deployable dotfiles have not yet been selected. Do not copy this README into
the home directory.

Apply files individually after reviewing the diff against the target. Keep
machine-specific values in `hosts/` rather than hardcoding them in shared
dotfiles. No dotfile deployment script is implemented yet.

Do not copy the entire existing home directory here. Exclude browser profiles,
databases, caches, runtime state, backups, and secrets.
