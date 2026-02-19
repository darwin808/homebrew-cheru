cask "cheru" do
  version "0.3.4"

  arch arm: "aarch64", intel: "x64"

  url "https://github.com/darwin808/cheru/releases/download/v#{version}/Cheru_#{version}_#{arch}.dmg"
  sha256 :no_check

  name "Cheru"
  desc "Desktop launcher with fuzzy search, app indexing, and file browsing"
  homepage "https://github.com/darwin808/cheru"

  app "Cheru.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Cheru.app"]
    system "open", "#{appdir}/Cheru.app"
  end

  uninstall_postflight do
    File.delete(File.expand_path("~/Library/LaunchAgents/com.cheru.launcher.plist")) rescue nil
  end

  zap trash: [
    "~/.cache/cheru",
    "~/.config/cheru",
    "~/Library/Caches/com.cheru.launcher",
    "~/Library/LaunchAgents/com.cheru.launcher.plist",
    "~/Library/Preferences/com.cheru.launcher.plist",
    "~/Library/Saved Application State/com.cheru.launcher.savedState",
  ]
end
