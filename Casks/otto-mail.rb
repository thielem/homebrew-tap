cask "otto-mail" do
  version "0.4.0"
  sha256 "2bf362c9665009887ad2a6245bf8234b07ef4e92832194b85341d74f6a359c8e"

  url "https://github.com/thielem/homebrew-tap/releases/download/otto-mail-v#{version}/OttoMail-#{version}.zip"
  name "Otto Mail"
  desc "Native mail client with on-device classification and an agent CLI"
  homepage "https://github.com/thielem/homebrew-tap"

  depends_on macos: ">= :tahoe"

  app "OttoMail.app", target: "Otto Mail.app"
  binary "#{appdir}/Otto Mail.app/Contents/MacOS/otto"

  uninstall launchctl: "com.adaiadata.ottomail.agent",
            quit:      "com.adaiadata.ottomail"

  zap trash: [
    "~/Library/Application Support/com.adaiadata.ottomail",
    "~/Library/Caches/com.adaiadata.ottomail",
    "~/Library/Preferences/com.adaiadata.ottomail.plist",
  ]
end
