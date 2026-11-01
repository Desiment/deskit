# Portage Source

This directory is the source representation of the host's `/etc/portage`.

Keep `make.conf`, package USE fragments, package environment files, profiles,
repository configuration, and package sets here. Do not copy Portage caches,
backups, savedconfig, or generated metadata into Git.

The live `make.profile` symlink is intentionally not copied because it points
into the installed Gentoo repository and is host/runtime state rather than
source configuration.

The active overlay is a separate repository. It should be deployed to a
root-owned `/var/db/repos/des-overlay` tree before Portage uses it.
