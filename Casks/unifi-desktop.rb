cask "unifi-desktop" do
  version "0.1.8"
  sha256 "70dd2ab0c397c1027007f6ac093fe2639508031bd4bf6c988cceb0f62360b18d"

  url "https://github.com/thorrsson/osx-unifi/releases/download/v#{version}/UniFiDesktop-#{version}.dmg"
  name "UniFi Desktop"
  desc "Manage a UniFi network through the controller's local Network API"
  homepage "https://thorrsson.github.io/osx-unifi/"

  livecheck do
    url "https://raw.githubusercontent.com/thorrsson/osx-unifi/main/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "UniFi Desktop.app"

  zap trash: [
    "~/Library/Caches/com.thorrsson.osx-unifi",
    "~/Library/HTTPStorages/com.thorrsson.osx-unifi",
    "~/Library/Preferences/com.thorrsson.osx-unifi.plist",
    "~/Library/Saved Application State/com.thorrsson.osx-unifi.savedState",
  ]
end
