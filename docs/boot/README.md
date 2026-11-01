# Boot and Dual Boot

The current host documents EFI stub and rEFInd. Windows dual boot is a goal
mentioned in `hosts/des-laptop/system/kernel/README.md`, not an already
deployed configuration in this tree. Kernel filesystem support alone does not
set up the firmware boot entries, ESP, or shared storage.

Before recording or applying host-specific boot configuration, document and
verify on the target machine:

- The actual firmware mode, ESP mountpoint, partition layout, and backups.
- Whether Gentoo and Windows use one ESP or separate ESPs; avoid modifying
  Windows boot files while configuring rEFInd.
- EFI loader and kernel locations, filesystem UUIDs, and boot entry names.
- Windows Fast Startup/hibernation state before writing to any shared NTFS
  volume; encryption/recovery-key requirements if applicable.
- The rollback procedure and a tested way to boot from external media.

Keep any resulting deployable rEFInd or boot-entry sources under
`hosts/<host>/system/boot/`; only move genuinely portable fragments to
`system/boot/`. Do not copy live ESP contents or generated kernel images into
this repository. No automatic boot deployment is provided.
