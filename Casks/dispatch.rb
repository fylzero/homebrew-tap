cask "dispatch" do
  version "1.3.0"
  sha256 "ef3a4486dde2003e378e6de0b05c72c69cc20b724727615b6e9334a85e42b796"

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
