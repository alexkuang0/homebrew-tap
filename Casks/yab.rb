cask "yab" do
  version "0.37.11"
  sha256 :no_check

  url "https://yetanotherbrowser.com/yab.dmg"
  name "Yab"
  desc "WebKit browser with AI agents that work in your tabs"
  homepage "https://yetanotherbrowser.com/"

  livecheck do
    url "https://yetanotherbrowser.com/appcast.json"
    regex(/"version"\s*:\s*"(\d+(?:\.\d+)+)"/i)
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Open yab.app/Contents/Resources/Payload/yab.app", target: "Yab.app"

  uninstall quit: "dev.serafim.fast"

  zap trash: [
    "~/Library/Application Support/Yab*",
    "~/Library/Caches/dev.serafim.fast",
    "~/Library/HTTPStorages/dev.serafim.fast",
    "~/Library/Preferences/dev.serafim.fast.plist",
    "~/Library/WebKit/dev.serafim.fast",
  ]
end
