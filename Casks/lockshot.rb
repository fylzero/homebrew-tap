cask "lockshot" do
  version "1.6.1"
  sha256 "43ecd2e72d10ccd697f506bbebd1e72c55b7f397d9636a52f49c7ae0fa569154"

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
