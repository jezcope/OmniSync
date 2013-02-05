# OmniSync script

This is a one-line AppleScript that triggers [OmniFocus](http://www.omnigroup.com/products/omnifocus/) to perform a sync, along with a LaunchAgent definition to make it run every 5 minutes. You can tweak the LaunchAgent file (`uk.co.jezcope.omnisync.plist`) to change the frequency.

You can either install the [thor gem](http://rubygems.org/gems/thor) and run `thor omni_sync:install` to install it automatically, or do it yourself:

-   `OmniSync.applescript` goes in `~/Library/Scripts`
-   `uk.co.jezcope.omnisync.plist` goes in `~/Library/LaunchAgents`
-   Start it with [`launchctl`](http://developer.apple.com/library/mac/#documentation/Darwin/Reference/ManPages/man1/launchctl.1.html)
