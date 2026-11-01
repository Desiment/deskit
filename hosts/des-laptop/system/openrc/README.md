# OpenRC Source

Track only custom service definitions and host-specific service configuration.
Do not copy package-provided init scripts into this directory.

- `init.d/`: custom init scripts
- `conf.d/`: custom service configuration
- `runlevels/`: declarative service membership, applied with `rc-update`
