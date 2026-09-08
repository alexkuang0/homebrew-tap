cask "waku" do
  version "0.1.18"
  sha256 "a2a6a98d0c782f336caf4a110753fc25d4492e2eb8d0cf42c30734ca3aa8d89a"

  url "https://releases.waku.sh/Waku-#{version}.dmg"
  name "Waku"
  desc "Native desktop app for working with local coding agents"
  homepage "https://waku.sh/"

  livecheck do
    url "https://releases.waku.sh/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Waku.app"

  uninstall quit: [
    "sh.waku",
    "sh.waku.computer-use",
  ]

  zap trash: [
    "~/.waku",
    "~/Library/Application Support/Waku",
  ]
end
