# Homebrew Tap (alexkuang0/tap) — Agent Guidelines

Personal third-party tap. Casks live in `Casks/` and commit directly to `main`
via the bump workflow — there is no `homebrew-cask` submission, so notability,
repo-age, and PR-hygiene checks do not apply.

## Before authoring a cask

1. **Check for an existing tap first.** Search the web and the Homebrew cask
   index (`formulae.brew.sh/api/cask/<token>.json`, `.../api/cask.json`) for an
   official or third-party cask. If one exists, stop and report — don't
   duplicate it.
2. **Inspect the vendor artifact before writing anything.** Download and mount
   it, then confirm: exact `.app` bundle name, bundle ID, architectures
   (`lipo -archs`), minimum macOS (`LSMinimumSystemVersion`), helper/updater
   IDs, and the authoritative update feed. These are easy to get subtly wrong.
   Watch for installer-wrapper DMGs whose real app is nested (e.g. an
   `Open <name>.app` launcher embedding `Payload/<name>.app`).

## Cask conventions

- **Self-updating apps → `auto_updates true`.**
- **Mutable download URL → `sha256 :no_check`** (never guess a checksum).
  Versioned URL → pin the sha256, recomputed from the downloaded artifact.
- **Token** = bare product name, lowercase, hyphens.
- **Extract the real app** when the DMG ships a wrapper:
  `app "Open yab.app/Contents/Resources/Payload/yab.app", target: "Yab.app"`.
- **`uninstall quit:`** = the app's bundle ID (add helper IDs only if they run
  as separate processes). Derive **`zap`** paths from `brew generate-zap` plus a
  manual sweep; drop system-file noise (e.g. Control Center `ByHost` plists).
- **Livecheck** = the authoritative vendor feed (`appcast.json`, `appcast.xml`,
  `update2`), not the homepage or a GitHub API.

## Auto-bump (mandatory)

Every cask gets a job in `.github/workflows/bump-waku.yml`:

- `:no_check` casks → bump the `version` stanza only.
- Versioned-URL casks → bump `version` **and** recompute `sha256` from the
  downloaded artifact.

Parse the vendor feed with a provider-specific parser, compare versions
numerically (never downgrade), and touch only the intended version/sha stanzas.
Steps run sequentially and commit/push straight to `main`.

## Local testing

- `HOMEBREW_NO_INSTALL_FROM_API=1` so Homebrew reads the working tree.
- Use a tap symlink (or install by token) so `brew` sees your edits; restore any
  temporary tap override afterward.
- Install/uninstall by **token name**, not file path — `brew install
  ./Casks/x.rb` fails under a tap symlink.
- Validate: `brew style`, `brew audit --cask --online` (prints nothing on
  success — silent means pass), then install / uninstall / `--zap` (data should
  survive plain uninstall and be gone after `--zap`).
- When iterating on `zap`, reinstall before re-zapping — `brew uninstall --zap`
  reads the *cached* cask, not your working copy.

## Git

Commit and push only when explicitly requested.
