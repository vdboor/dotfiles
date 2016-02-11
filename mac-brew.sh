#!/bin/sh

# Bash completion
sudo curl https://raw.githubusercontent.com/django/django/master/extras/django_bash_completion -o /usr/local/bin/django_bash_completion.sh

# Base tools
brew install tree wget pstree colordiff ack lesspipe

# Django development
brew install git gettext libjpeg libtiff libyaml

for file in `brew list gettext | grep '/bin/'`
do
  ln -s $file /usr/local/bin/
done

# Daemons
brew install memcached redis
mkdir -p ~/Library/LaunchAgents
ln -sfv $(brew --prefix)/opt/memcached/*.plist ~/Library/LaunchAgents
ln -sfv $(brew --prefix)/opt/redis/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.memcached.plist
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

# Postgres access (downloaded from Enterprise DB)
# Or set unix_socket_directories in /Library/PostgreSQL/9.5/data/postgresql.conf 
# Or export PGHOST=/private/tmp/
sudo  mkdir /var/pgsql_socket/
ln -s /private/tmp/.s.PGSQL.5432 /var/pgsql_socket/

# Fix loading _psycopg.so (could also set LD_LIBRARY_PATH, but this is easier)
ln -s /Library/PostgreSQL/9.5/lib/libssl.1.0.0.dylib /usr/local/lib/
ln -sf /Library/PostgreSQL/9.5/lib/libcrypto.1.0.0.dylib /usr/local/lib/

# Pyenv
#brew install pyev
