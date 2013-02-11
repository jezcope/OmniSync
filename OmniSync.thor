class OmniSync < Thor
  include Thor::Actions

  SCRIPT_PATH = File.expand_path("~/Library/Scripts/OmniSync.applescript")
  PLIST_PATH  = File.expand_path("~/Library/LaunchAgents/uk.co.jezcope.omnisync.plist")

  desc "install", "install the AppleScript and LaunchAgent"
  def install
    copy_file "OmniSync.applescript", SCRIPT_PATH
    template  "uk.co.jezcope.omnisync.plist.tt", PLIST_PATH
    system "launchctl load #{PLIST_PATH}"
  end

  desc "uninstall", "remove the AppleScript and LaunchAgent"
  def uninstall
    system "launchctl unload #{PLIST_PATH}"
    remove_file SCRIPT_PATH
    remove_file PLIST_PATH
  end

  desc "reinstall", "remove the AppleScript and LaunchAgent"
  def reinstall
    thor "omni_sync:uninstall"
    thor "omni_sync:install"
  end

  def self.source_root
    File.dirname(__FILE__)
  end

end
