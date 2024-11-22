#!/bin/sh

# Bash completion
sudo curl https://raw.githubusercontent.com/django/django/master/extras/django_bash_completion -o /usr/local/bin/django_bash_completion.sh

# Base tools
brew install tree wget pstree colordiff ack lesspipe gnupg pinentry-mac qlstephen

# Cluster management
brew tap boz/repo
brew install kubernetes-cli helm kube-ps1 kubectx brew tap boz/repo

# Development tools
brew install libxml2 libxslt xz zlib libjpeg libtiff libyaml libmagic libsass libmemcached sqlite3 pyenv git gettext

for file in `brew list gettext | grep '/bin/'`
do
  ln -s $file /usr/local/bin/
done

# Daemons
brew install memcached redis mailhog
mkdir -p ~/Library/LaunchAgents
brew services start memcached redis mailhog

# Postgres access (downloaded from Enterprise DB)
# Or set unix_socket_directories in /Library/PostgreSQL/9.5/data/postgresql.conf 
# Or export PGHOST=/private/tmp/
sudo  mkdir /var/pgsql_socket/
ln -s /private/tmp/.s.PGSQL.5432 /var/pgsql_socket/
