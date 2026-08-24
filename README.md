# Homebrew Tap

Third-party Homebrew tap. Casks live in `Casks/`.

## Install

```bash
brew tap alexkuang0/tap
brew trust alexkuang0/tap
brew install --cask ego-lite
```

## Casks

### ego-lite

[ego lite](https://lite.ego.app/) is a Chromium browser for running AI-agent web automation in isolated Spaces. macOS only (Apple Silicon and Intel). Windows and Linux are not shipped yet.

```bash
brew install --cask alexkuang0/tap/ego-lite
```

The cask also links `ego-browser` onto your PATH from inside the app bundle.

### waku

[Waku](https://waku.sh/) is a native desktop app for working with local coding agents. macOS only (Apple Silicon, Ventura or newer).

```bash
brew install --cask alexkuang0/tap/waku
```

## Update / uninstall

The apps self-update. `brew upgrade` is a no-op unless you pass `--greedy`.

```bash
brew upgrade --cask --greedy ego-lite waku
brew uninstall --cask ego-lite waku
brew uninstall --cask --zap ego-lite waku
```
