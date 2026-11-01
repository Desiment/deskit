# deskit Scripts

This directory is reserved for tools that check and selectively apply deskit
sources. No deploy commands have been implemented yet. A future tool should
accept explicit components and destinations, show a dry-run diff by default,
refuse to overwrite unrelated files, and require separate confirmation for
root-owned system files. Never automatically change the ESP or boot entries.

Potential commands (not available yet):

- `deploy-portage`
- `deploy-openrc`
- `deploy-kernel`
- `deploy-dotfiles`
- `check`
