cask "otto-mail" do
  version "0.4.1"
  sha256 "9d230a51be3c4d5ae4526e79a5c65e82db814827557fe3a1d48f8e9b37ae559d"

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
