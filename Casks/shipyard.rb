cask "shipyard" do
  version "1.21.6"
  sha256 "061ee1909c58d52f8dee271042cf2991c09ce9eae3ec2355f8dfd5096f388cc8"

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
