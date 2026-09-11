cask "waku" do
  version "0.1.19"
  sha256 "b4dbfb6377be68ab8649cf8063cdae0156dc6f5a862c1c0ba77b4d6157e3d406"

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
