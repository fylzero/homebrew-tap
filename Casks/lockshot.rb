cask "lockshot" do
  version "1.6.2"
  sha256 "8a132efb4ed98f230a78756982b4f7d5d3161b30720ff910548a579d2c4d141b"

  url "https://github.com/fylzero/lockshot/releases/download/v#{version}/Lockshot-macos-arm64.dmg"
  name "Lockshot"
  desc "Screenshot capture and markup tool"
  homepage "https://github.com/fylzero/lockshot"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Lockshot.app"

  zap trash: [
    "~/Library/Application Support/com.lockshot.app",
    "~/Library/Caches/com.lockshot.app",
    "~/Library/Preferences/com.lockshot.app.plist",
    "~/Library/Saved Application State/com.lockshot.app.savedState",
    "~/Library/WebKit/com.lockshot.app",
  ]
end
