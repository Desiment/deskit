# deskit Documentation

Documentation describes system components and decisions. Deployable files live
under `hosts/`, `system/`, or `dotfiles/` and should not be duplicated here.

`boot/` records dual-boot decisions separately from kernel build notes; do not
place active EFI binaries or machine-specific disk identifiers in docs.

## Components

- `components/graphical-session/`: Wayland, Sway, Waybar, launchers, lock screen, and portals.
- `components/media/`: audio and video workflows, PipeWire, JACK, MPD, FFmpeg, and capture.
- `components/hardware/`: device support, firmware, power, input, storage, and sensors.
- `components/networking/`: NetworkManager, iwd, VPN, firewall, DNS, and proxy policy.
- `components/applications/`: Firefox, Zathura, Ranger, Neovim, Papis, and related tools.
