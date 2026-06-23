# Hassio App (aka Addon) Transmission

Home Assistant app for the Transmission BitTorrent client, packaged as a Docker image on Alpine Linux.

## Upgrading Transmission

### How the package is pinned

- `transmission/Dockerfile` — Alpine base image (`FROM ghcr.io/home-assistant/base:<version>`, a generic multi-arch base) and the `transmission-daemon` package version pin (e.g. `~=4.0.6-r4`)
- `transmission/config.yaml` — Add-on version (bump on every release)
- `transmission/CHANGELOG.md` — Release notes

Images are built and published by `.github/workflows/builder.yaml` using the Home Assistant builder composable actions (`prepare-multi-arch-matrix`, `build-image`, `publish-multi-arch-manifest`) on native amd64/arm64 runners. Each arch is built and pushed separately, then combined into a multi-arch manifest at `config.yaml`'s `image` (no `{arch}` placeholder). There is no `build.yaml`.

### Checking available versions

- Transmission is in Alpine's `community` repo
- Check the version for a specific Alpine release: `https://pkgs.alpinelinux.org/package/v<VERSION>/community/x86_64/transmission-daemon`
- Check Alpine `edge` for upcoming versions: `https://pkgs.alpinelinux.org/package/edge/community/x86_64/transmission-daemon`
- Overview of all distros: `https://repology.org/project/transmission/versions`

### Upgrade checklist

1. Find the latest stable Alpine release at https://www.alpinelinux.org/releases/
2. Verify the Transmission version available in that Alpine release (see URLs above)
3. Update `transmission/Dockerfile` — bump the `FROM ghcr.io/home-assistant/base:<version>` base image to the new Alpine version, and update the `transmission-daemon` package pin to the exact version (e.g. `~=4.1.2-r0`)
4. Bump version in `transmission/config.yaml` (patch bump for same Transmission version, minor bump for new Transmission version)
5. Add changelog entry in `transmission/CHANGELOG.md`
