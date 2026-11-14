cask "compute-manager" do
  version "0.1.0"
  sha256 "63c5ff2e68776a450e5ca5ec2291ceaebbe3e3600e61549b5617602c489f825f"

  url "https://github.com/thielem/computemanager/releases/download/v#{version}/ComputeManager-#{version}.zip"
  name "Compute Manager"
  desc "Menu bar gate for heavy agent jobs and fan control"
  homepage "https://github.com/thielem/computemanager"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ComputeManager.app"
  # Runs before `app` is moved, so the path is inside the staged bundle (copies fand out of it).
  installer script: {
    executable: "/bin/bash",
    args:       ["#{staged_path}/ComputeManager.app/Contents/Resources/install-fand.sh"],
    sudo:       true,
  }
  binary "#{appdir}/ComputeManager.app/Contents/MacOS/cgate"

  # Order is fixed by Homebrew: launchctl, quit, script, delete; all before the app is removed.
  uninstall launchctl: "com.moritzthiele.cgate.fand",
            quit:      "com.moritzthiele.cgate",
            # Must not depend on the app (it may already be trashed); launchctl stopped fand already.
            script:    {
              executable: "/bin/sh",
              args:       [
                "-c",
                "f=/usr/local/libexec/computemanager/fand; [ -x \"$f\" ] && \"$f\" --revert-auto; exit 0",
              ],
              sudo:       true,
            },
            delete:    [
              "/Library/LaunchDaemons/com.moritzthiele.cgate.fand.plist",
              "/usr/local/libexec/computemanager",
              "/var/log/computemanager-fand.log",
              "/var/run/computemanager",
            ]

  zap trash: [
    "~/Library/Application Support/ComputeManager",
    "~/Library/Logs/ComputeManager",
    "~/Library/Preferences/com.moritzthiele.cgate.plist",
  ]

  caveats <<~EOS
    Fans revert to Auto when Compute Manager quits.
    Claude Code plugin:
      claude plugin marketplace add thielem/computemanager
      claude plugin install compute-gate@computemanager
  EOS
end
