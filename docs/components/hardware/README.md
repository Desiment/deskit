# Hardware

Hardware describes how the host exposes and manages physical devices:

- graphics and Intel firmware
- keyboard, touchpad, fingerprint reader, and other input devices
- power, ACPI, thermal management, and battery
- NVMe, filesystems, and dual-boot storage
- firmware, sensors, and radio devices

Kernel configuration belongs under the host's `system/kernel/` directory.
Bootloader and ESP planning belongs in `docs/boot/`; reviewed host-specific
boot sources belong under `hosts/<host>/system/boot/`.
