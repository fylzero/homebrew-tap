cask "recon" do
  version "1.19.8"
  sha256 "7a79a4e27ba038359ffc40f20e0f6532b5e30a458aaf75723682eeff4481e376"

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
