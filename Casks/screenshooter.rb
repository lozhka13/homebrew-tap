cask "screenshooter" do
  version "2.2.1"
  sha256 "38d977254ea57541876faf2c09b41ecdea1e3ec8e7916364b81acacbd58d518b"

  url "https://github.com/lozhka13/Screenshooter/releases/download/v#{version}/Screenshooter-#{version}.dmg"
  name "Screenshooter"
  desc "Sort screenshots and screen recordings into folders with one key"
  homepage "https://github.com/lozhka13/Screenshooter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Screenshooter.app"

  uninstall quit: "com.lozhka13.screenshooter"

  zap trash: [
    "~/Library/Preferences/com.lozhka13.screenshooter.plist",
    "~/Screenshots/.screenshooter",
  ]

  caveats <<~EOS
    Screenshooter is signed ad hoc but not notarized. If macOS refuses to open it:
      xattr -dr com.apple.quarantine #{appdir}/Screenshooter.app

    For background compression:
      brew install ffmpeg oxipng
  EOS
end
