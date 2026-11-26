cask "shipyard" do
  version "1.22.1"
  sha256 "89b8445ea52f8a482e2ecd9abcc2d7d6d712f6871d4e3b60266a06559937acf0"

  url "https://github.com/fylzero/shipyard/releases/download/v#{version}/Shipyard-macos-arm64.dmg"
  name "Shipyard"
  desc "Git client"
  homepage "https://github.com/fylzero/shipyard"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Shipyard.app"

  zap trash: [
    "~/Library/Application Support/com.shipyard.app",
    "~/Library/Caches/com.shipyard.app",
    "~/Library/Preferences/com.shipyard.app.plist",
    "~/Library/Saved Application State/com.shipyard.app.savedState",
    "~/Library/WebKit/com.shipyard.app",
  ]
end
