# User Dotfiles

Store opt-in user configuration here. Its structure mirrors the target user's
home directory: `.config/` contains application configuration and shell files
remain at the top level. `.config/nvim/` is an independent Git submodule;
other deployable dotfiles have not yet been selected. Do not copy this README
into the home directory.

Apply files individually after reviewing the diff against the target. Keep
machine-specific values in `hosts/` rather than hardcoding them in shared
dotfiles. No dotfile deployment script is implemented yet.

Do not copy the entire existing home directory here. Exclude browser profiles,
databases, caches, runtime state, backups, and secrets.
