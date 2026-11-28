cask "recon" do
  version "1.20.2"
  sha256 "b3aa083fd60f8913fc44feb465a1b1c49b1ac73ad64ab357f7c634ab8156f682"

  url "https://github.com/fylzero/recon/releases/download/v#{version}/Recon-macos-arm64.dmg"
  name "Recon"
  desc "Database management application"
  homepage "https://github.com/fylzero/recon"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "Recon.app"

  zap trash: [
    "~/Library/Application Support/com.recon.app",
    "~/Library/Caches/com.recon.app",
    "~/Library/Preferences/com.recon.app.plist",
    "~/Library/Saved Application State/com.recon.app.savedState",
    "~/Library/WebKit/com.recon.app",
  ]
end
