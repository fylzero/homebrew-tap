# fylzero/tap

Homebrew casks for [Dispatch](https://github.com/fylzero/dispatch), [Lockshot](https://github.com/fylzero/lockshot), [Recon](https://github.com/fylzero/recon) and [Shipyard](https://github.com/fylzero/shipyard). Apple Silicon Macs only.

```sh
brew install fylzero/tap/dispatch
brew install fylzero/tap/lockshot
brew install fylzero/tap/recon
brew install fylzero/tap/shipyard
```

Each app updates itself, so `brew upgrade` leaves them alone unless you pass `--greedy`. `brew uninstall --zap fylzero/tap/<app>` also removes its settings and caches.

## How the casks stay current

[`bump.yml`](.github/workflows/bump.yml) runs every hour. It reads each app's latest GitHub release, takes the version from the tag and the sha256 from the DMG's asset digest, audits the changed casks, and commits them. Run it from the Actions tab to pick up a release right away, or locally with:

```sh
scripts/bump-casks.sh            # every cask
scripts/bump-casks.sh lockshot   # one
```
