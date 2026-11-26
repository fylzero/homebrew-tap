cask "dispatch" do
  version "1.2.2"
  sha256 "ca2d31450a4dc4905b2179e6abb413212597f17375da93a0fd4fa172a34931a1"

  url "https://github.com/fylzero/dispatch/releases/download/v#{version}/Dispatch-macos-arm64.dmg"
  name "Dispatch"
  desc "Terminal emulator"
  homepage "https://github.com/fylzero/dispatch"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Dispatch.app"

  zap trash: [
    "~/Library/Application Support/com.dispatch.app",
    "~/Library/Caches/com.dispatch.app",
    "~/Library/Preferences/com.dispatch.app.plist",
    "~/Library/Saved Application State/com.dispatch.app.savedState",
    "~/Library/WebKit/com.dispatch.app",
  ]
end
