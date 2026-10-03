cask "waku" do
  version "0.1.20"
  sha256 "b01d0cbc3cc6f4e4717d4be56e2f58b46114ad2f9439cf28a228e4a7585e53ce"

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
