cask "screenshooter" do
  version "2.0.0"
  sha256 "60242a0c892264f81e7432f569f5b61aae9f98878175714ed5fedcd20b46943c"

  url "https://github.com/lozhka13/Screenshooter/releases/download/v#{version}/Screenshooter-#{version}.dmg"
  name "Screenshooter"
  desc "Sort screenshots and screen recordings into folders with one key"
  homepage "https://github.com/lozhka13/Screenshooter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

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
