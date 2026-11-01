# deskit

Personal collection of dotfiles, system configuration, scripts, documentation,
and Gentoo packages. Pick only the pieces needed for a given machine; this
tree is not a one-shot installer.

## Layout

- `dotfiles/`: opt-in user configuration; `config/<app>/` maps explicitly to
  `~/.config/<app>/`. `config/nvim/` and `config/ranger/` are the public
  `nvimrc` and `rangerrc` submodules; `config/sway/`, `config/waybar/`,
  `config/kitty/`, and `config/rofi/` are tracked directly in this repository.
- `system/`: shared system sources; not a live `/etc`.
- `hosts/`: machine-specific sources; currently `des-laptop/system/`.
- `overlay/`: the independently versioned `des-overlay` Git submodule.
- `scripts/`: future checks and explicit deployment tools.
- `docs/`: decisions and component documentation, including boot planning.

The existing Portage and kernel files remain under `hosts/des-laptop/` until
each candidate for reuse has been reviewed. Do not copy all of a host's files
onto a different machine. There are no general-purpose deploy commands yet.

Clone with `git clone --recurse-submodules https://github.com/Desiment/deskit.git`
or run `git submodule update --init --recursive` after cloning. Publishing a
submodule update requires pushing that submodule's commit before updating the
pointer here. The `nvimrc` submodule is a source copy, not the active
`~/.config/nvim` installation.

## System Components

- `graphical-session/`: Wayland, Sway, Waybar, Wofi, and portals.
- `media/`: ALSA, JACK, PipeWire, MPD, FFmpeg, MPV, and capture.
- `hardware/`: graphics, input, power, storage, firmware, sensors, and radios.
- `networking/`: wired, wireless, VPN, firewall, DNS, and proxy policy.
- `applications/`: browser, editor, reader, reference, and file-management workflows.

## Applying a Selection

Sources remain user-owned. Review selected files against the destination before
applying anything; system configuration should be copied into root-owned
locations rather than symlinked to this writable tree:

- Portage source: `hosts/<host>/system/portage/` -> `/etc/portage/`.
- Custom OpenRC files: `hosts/<host>/system/openrc/` -> `/etc/init.d/` and
  `/etc/conf.d/` as appropriate.
- Dotfiles: select an application under `dotfiles/config/` and review its files
  before copying them to `~/.config/<app>/`. Other dotfile destinations must
  be mapped explicitly; never copy the whole `dotfiles/` tree.
- Gentoo overlay: maintained separately under `overlay/`; a root-owned copy
  under `/var/db/repos/des-overlay` is the intended deployment target.

The source entry in `hosts/des-laptop/system/portage/repos.conf/des-overlay.conf`
and the active root-owned `/etc/portage` entry point directly to `deskit/overlay`.
This is still a user-owned repository, **not** the intended root-owned
deployment model described above. Move it only as a separate, validated
Portage migration.

Do not commit secrets, browser profiles, caches, runtime state, or generated
Portage metadata. For boot changes, see `docs/boot/` before touching the ESP.

## Current Host

- OS: Gentoo Linux with the LLVM profile.
- Init: OpenRC.
- Boot: EFI stub and rEFInd; Windows dual-boot is being planned.
- Session: Wayland, wlroots, Sway, and seatd.
- Audio: ALSA, JACK, PipeWire, and WirePlumber.
- Main languages: Python, R, Julia, and LaTeX.
