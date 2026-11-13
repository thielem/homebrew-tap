cask "otto-mail" do
  version "0.2.0"
  sha256 "cc2697a1bdeb8ec9de7fca0db4a1242589d22ab9e12f96e825e13bc1574957a6"

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
