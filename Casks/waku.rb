cask "waku" do
  version "0.1.17"
  sha256 "45c0f3613171e5aa8973a4cde81ed3bf32ec38bc75cf4bd9a2529b88da33e7b3"

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
