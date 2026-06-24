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

### Releasing

Merging the version bump to `main` triggers `.github/workflows/builder.yaml`, which
builds, signs, and publishes the per-arch images plus the multi-arch manifest tagged
with the new version and `latest`. Pull requests only run a **test build** (no push),
so: open a PR, confirm Builder + Lint are green, then merge to `main` to publish.

The manifest is published to `ghcr.io/maorcc/hassio-addon-transmission`. This GHCR
package must stay **Public** so Home Assistant Supervisor can pull it anonymously
(it was created Public automatically because the repo is public).

### Verifying a published release

Confirm the tag is published, public, and multi-arch (anonymous pull):

```bash
tok=$(curl -s "https://ghcr.io/token?scope=repository:maorcc/hassio-addon-transmission:pull&service=ghcr.io" | jq -r .token)
curl -s -H "Authorization: Bearer $tok" -H "Accept: application/vnd.oci.image.index.v1+json" \
  https://ghcr.io/v2/maorcc/hassio-addon-transmission/manifests/<version> \
  | jq -c '[.manifests[] | select(.platform.os=="linux") | "\(.platform.os)/\(.platform.architecture)"]'
# expect: ["linux/arm64","linux/amd64"]
```

### Troubleshooting: Home Assistant still shows the old version

After a release, Supervisor's add-on store cache can lag — it may show "update available"
yet report "up-to-date" on click, or keep showing the old version. Force a re-sync:

```bash
ha store reload && ha supervisor reload
ha addons info transmission | grep -E "version|update_available"   # expect version_latest: <new>
ha addons update transmission
```

If still stuck, restart the Supervisor (Settings → System → ⋮ → Restart Supervisor).
