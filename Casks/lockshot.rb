cask "lockshot" do
  version "1.5.0"
  sha256 "f8f8885ee5943f45eb34346c199579344ce5c31685c9f604bc301098af1470a3"

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
