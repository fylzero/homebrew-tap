cask "shipyard" do
  version "1.21.13"
  sha256 "b91a3433362fc2404804570d13300a6a5370a18aa2c1c9d19c8ee8a117b38a4e"

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
