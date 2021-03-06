#!/bin/bash
#
# To find values, use:
#
#  - defaults read > 1.txt
#  - make changes in the settings
#  - defaults read > 2.txt
#  - vimdiff 1.txt 2.txt
#

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Set root shell to /bin/bash (not /bin/sh)
sudo chsh -s /bin/bash

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disable gamed being active all the time
defaults write com.apple.gamed Disabled -bool true

# Disable the “Are you sure you want to open this application?” dialog
#defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable the sudden motion sensor as it’s not useful for SSDs
#sudo pmset -a sms 0

# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Faster key repeat
defaults write -g InitialKeyRepeat -int 25 # default 68
defaults write -g KeyRepeat -int 2 # default not set

# Disable auto-correct
#defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
#defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Airdrop on ethernet cards too
#defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Dock resizing
defaults write com.apple.dock largesize -int 100
defaults write com.apple.dock magnification -int 1

# Terminal style
TERM_PROFILE="Pro"
defaults write com.apple.terminal 'Default Window Settings' -string "${TERM_PROFILE}";
defaults write com.apple.terminal 'Startup Window Settings' -string "${TERM_PROFILE}";

# Show the ~/Library folder
#chflags nohidden ~/Library

# Add iOS Simulator to Launchpad
#sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app" "/Applications/iOS Simulator.app"

# Safari Privacy: don’t send search queries to Apple
#defaults write com.apple.Safari UniversalSearchEnabled -bool false
#defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Safari: Enable developper tools
defaults write com.apple.Safari IncludeDebugMenu 1

# Enable the WebKit Developer Tools in the Mac App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

for app in "Dock" "Finder" "Safari" "SystemUIServer"; # "Terminal";
do
    killall "${app}" > /dev/null 2>&1
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
