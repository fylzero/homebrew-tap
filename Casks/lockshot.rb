cask "lockshot" do
  version "1.3.5"
  sha256 "00a9694ffa6caf40c16d674d8e37dc80fc1111372f9328381b3fc210d222a17c"

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
