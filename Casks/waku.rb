cask "waku" do
  version "0.1.16"
  sha256 "1b83cc7b7505daa4ced58b1c4ac26c919c61f5a16bb26a17d8b6f4e56e5b39c5"

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
