cask "otto-mail" do
  version "0.4.2"
  sha256 "e7ee1185588a2471f6ccf41058331a65a9da297a7ec15f31cef7cd75cf7ac206"

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
