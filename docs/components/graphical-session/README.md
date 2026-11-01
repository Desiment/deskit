# Graphical Session

This component covers the user-facing Wayland session:

- Wayland and the Sway compositor
- Waybar, Wofi, Swaylock, and related launchers
- desktop portals and session environment
- display and monitor policy

Actual user configuration belongs under `dotfiles/config/` and maps to
`~/.config/` when selected for deployment.

The selected Sway and Waybar sources are `dotfiles/config/sway/config` and
`dotfiles/config/waybar/{config,style.css,scripts/temperature.sh}`. These are
based on the current active files (with whitespace-only cleanup), not a deploy
action. Review each file against the target home directory before applying;
do not copy the entire directory blindly.

The Sway config starts Waybar and expects `kitty`, `rofi` with a theme under
`~/.config/rofi/`, a wallpaper under `~/.local/share/backgrounds/`, and a
user-local PipeWire launcher. Waybar calls `swaymsg`, `kitty`, `iwctl`,
`helvum`, and its temperature script; its network module currently selects
`wlan0`. Check these paths, tools, and the interface name on other hosts.
Legacy `*.old` files, the incomplete `sway/env`, and empty Waybar theme
placeholders were intentionally not copied.
