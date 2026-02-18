cask "cheru" do
  version "0.2.0"

  if Hardware::CPU.arm?
    url "https://github.com/darwin808/cheru/releases/download/v#{version}/Cheru_#{version}_aarch64.dmg"
    sha256 :no_check
  else
    url "https://github.com/darwin808/cheru/releases/download/v#{version}/Cheru_#{version}_x64.dmg"
    sha256 :no_check
  end

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
