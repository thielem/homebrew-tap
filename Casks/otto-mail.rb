cask "otto-mail" do
  version "0.6.0"
  sha256 "ff19c5638d269fd0d8a621c6ae3ec62723f54433a0942cf7eb59cbb6480dc8b7"

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
