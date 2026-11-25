cask "dispatch" do
  version "1.0.0"
  sha256 "35904b04d5de8bd35955cfeab8ebd99ff2fc0706a5b4d6a0f06887783c88b8bc"

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
