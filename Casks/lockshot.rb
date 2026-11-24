cask "lockshot" do
  version "1.4.5"
  sha256 "78cb516bfedf2360ea45cea4b00f27ffe6b8b79fd9ac544a6f4d03e0c030d781"

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
