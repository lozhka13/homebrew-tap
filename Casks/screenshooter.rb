cask "screenshooter" do
  version "2.1.0"
  sha256 "ed36d3f749cd81223620eeae0c0577184d8e39317f812094f66b88b11fd5309d"

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
