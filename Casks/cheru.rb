cask "cheru" do
  version "0.2.2"

  arch arm: "aarch64", intel: "x64"

  url "https://github.com/darwin808/cheru/releases/download/v#{version}/Cheru_#{version}_#{arch}.dmg"
  sha256 :no_check

  name "Cheru"
  desc "Desktop launcher with fuzzy search, app indexing, and file browsing"
  homepage "https://github.com/darwin808/cheru"

  app "Cheru.app"

  zap trash: [
    "~/.cache/cheru",
    "~/Library/Caches/com.cheru.launcher",
    "~/Library/Preferences/com.cheru.launcher.plist",
    "~/Library/Saved Application State/com.cheru.launcher.savedState",
  ]
end
