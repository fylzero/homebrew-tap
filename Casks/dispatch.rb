cask "dispatch" do
  version "0.2.3"
  sha256 "77b70fe7c0b92ceffa3cf6f7834bc665d176cf3f6352a64b5b8d10eba86b34b4"

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
