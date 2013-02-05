class OmniSync < Thor
  include Thor::Actions

  desc "install", "install the AppleScript and LaunchAgent"
  def install
    copy_file "OmniSync.applescript", "~/Library/Scripts/OmniSync.applescript"
    copy_file "uk.co.jezcope.omnisync.plist", "~/Library/LaunchAgents/uk.co.jezcope.omnisync.plist"
    system "launchctl load ~/Library/LaunchAgents/uk.co.jezcope.omnisync.plist"
  end

  desc "uninstall", "remove the AppleScript and LaunchAgent"
  def uninstall
    system "launchctl unload ~/Library/LaunchAgents/uk.co.jezcope.omnisync.plist"
    remove_file "~/Library/Scripts/OmniSync.applescript"
    remove_file "~/Library/LaunchAgents/uk.co.jezcope.omnisync.plist"
  end

  def self.source_root
    File.dirname(__FILE__)
  end

end
