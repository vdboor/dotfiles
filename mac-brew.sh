#!/bin/sh

# Bash completion
sudo curl https://raw.githubusercontent.com/django/django/master/extras/django_bash_completion -o /usr/local/bin/django_bash_completion.sh

# Base tools
brew install tree wget pstree colordiff ack lesspipe

# Django development
brew install gettext libjpeg libtiff libyaml

for file in `brew list gettext | grep '/bin/'`
do
  ln -s $file /usr/local/bin/
done

# Daemons
brew install memcached redis
ln -sfv /usr/local/opt/memcached/*.plist ~/Library/LaunchAgents
ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

# Pyenv
#brew install pyev
