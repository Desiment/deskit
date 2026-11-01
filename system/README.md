# Shared System Sources

Put only reviewed, reusable system configuration here. Host-specific values
(disk IDs, interface names, kernel hardware options, and boot entries) belong
under `hosts/<host>/system/`. Existing files have not been moved from
`hosts/des-laptop/` merely because they look reusable.

The host's active Portage overlay entry points directly to
`/home/des/Development/deskit/overlay`. No compatibility symlinks are needed
in `system/`; add shared sources only after reviewing them for host-specific
values.
