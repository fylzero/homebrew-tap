cask "dispatch" do
  version "1.2.1"
  sha256 "db057d71d2f7cfc387eb1d0f1a2aad6ace44affd011eadd713a4fa7e15d5f99e"

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
