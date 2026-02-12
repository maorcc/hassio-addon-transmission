# Hassio App (aka Addon) Transmission

Home Assistant app for the Transmission BitTorrent client, packaged as a Docker image on Alpine Linux.

## Upgrading Transmission

### How the package is pinned

- `transmission/build.yaml` — Alpine base image version for each architecture
- `transmission/Dockerfile` — `transmission-daemon` package version pin (e.g. `~=4.0.6-r4`)
- `transmission/config.yaml` — Add-on version (bump on every release)
- `transmission/CHANGELOG.md` — Release notes

### Checking available versions

- Transmission is in Alpine's `community` repo
- Check the version for a specific Alpine release: `https://pkgs.alpinelinux.org/package/v<VERSION>/community/x86_64/transmission-daemon`
- Check Alpine `edge` for upcoming versions: `https://pkgs.alpinelinux.org/package/edge/community/x86_64/transmission-daemon`
- Overview of all distros: `https://repology.org/project/transmission/versions`

### Upgrade checklist

1. Find the latest stable Alpine release at https://www.alpinelinux.org/releases/
2. Verify the Transmission version available in that Alpine release (see URLs above)
3. Update `transmission/build.yaml` — all 5 arch base images to new Alpine version
4. Update `transmission/Dockerfile` — package pin to the exact version (e.g. `~=4.0.6-r4`)
5. Bump version in `transmission/config.yaml` (patch bump for same Transmission version, minor bump for new Transmission version)
6. Add changelog entry in `transmission/CHANGELOG.md`
