cask "recon" do
  version "1.20.1"
  sha256 "445486420cf9a4abe1b526bbe4cf09154b93c6e00b12a035e53ce5e7146a6512"

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
