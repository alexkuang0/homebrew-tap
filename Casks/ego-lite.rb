cask "ego-lite" do
  arch arm: "arm64", intel: "x64"

  version "0.4.7.4"
  sha256 :no_check

  url "https://cdn.ego.app/setup/macos/#{arch}/egolite.dmg"
  name "ego lite"
  desc "Browser for AI agents to run web automation"
  homepage "https://lite.ego.app/"

  livecheck do
    url "https://update.citrolabs.ai/service/update2", post_json: {
      request: {
        protocol:     "4.0",
        acceptformat: "download,run",
        os:           { platform: "Mac OS X", arch: arch },
        apps:         [{ appid: "com.citrolabs.ego.lite", updatecheck: {} }],
      },
    }
    regex(/"nextversion"\s*:\s*"(\d+(?:\.\d+)+)"/i)
    strategy :page_match
  end

  auto_updates true
  depends_on macos: :monterey

  app "ego lite.app"
  binary "#{appdir}/ego lite.app/Contents/Frameworks/ego Framework.framework/Versions/Current/Helpers/ego-browser"

  uninstall quit: [
    "com.citrolabs.ego.lite",
    "com.citrolabs.EgoUpdater",
  ]

  zap trash: [
    "~/Library/Application Support/Citro Labs/ego lite",
    "~/Library/Application Support/Citro/ego lite",
    "~/Library/Caches/Citro Labs/ego lite",
    "~/Library/Caches/Citro/ego lite",
    "~/Library/Caches/com.citrolabs.ego.lite",
    "~/Library/HTTPStorages/com.citrolabs.ego.lite",
    "~/Library/Preferences/com.citrolabs.ego.lite.plist",
    "~/Library/Saved Application State/com.citrolabs.ego.lite.savedState",
    "~/Library/WebKit/com.citrolabs.ego.lite",
  ]
end
