#!/bin/bash

# Bash Prompt Color script
# Diederik van der Boor <vdboor --at-- codingdomain.com>

L_RED="\[\033[1;31m\]"
L_GREEN="\[\033[1;32m\]"
L_YELLOW="\[\033[0;32m\]"
L_BLUE="\[\033[1;34m\]"
L_PURPLE="\[\033[1;35m\]"
L_CYAN="\[\033[1;36m\]"
GRAY="\[\033[1;30m\]"
WHITE="\[\033[1;37m\]"

RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
PURPLE="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
L_GRAY="\[\033[0;37m\]"

RESET="\[\033[0m\]"


# Auto adjust Konsole titles.
if [ -n "$KONSOLE_DBUS_SESSION" ] && [ "`id -u`" = "1000" ]; then
  function dbus_title         { qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION setTitle 1 "$1" >/dev/null; }
  function rename_konsole_tab { dbus_title "$(pwd | sed -re 's/.*(.{30})$/\1/' )/"; }
  function vim  { dbus_title "vim $@"  && `type -P vim`  "$@"; }
  function man  { dbus_title "man $@"  && `type -P man`  "$@"; }
  function ssh  { dbus_title "ssh $@"  && `type -P ssh`  "$@"; }
  function su   { dbus_title "su $@"   && `type -P su`   "$@"; }
  function sudo { dbus_title "sudo $@" && `type -P sudo` "$@"; }
  PROMPT_COMMAND=rename_konsole_tab
fi


# Determine the escape code to display a message in the xterm title bar:
# xterm:   export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
# screen:  export PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
case $TERM in
	xterm*|rxvt|Eterm|eterm|screen)
        if [ "`type -t dcop_title`" = "function" ]; then
          PS1_TITLE="\[\e]0;\u@\H:pts/\l\a"
        else
          PS1_TITLE="\[\e]0;\u@\H:pts/\l \w\a"
        fi
		;;
	*)
        # no title for virtual consoles
		PS1_TITLE=''
		;;
esac

PS1_TTY="`tty | sed -e 's/\/dev\///'`"


if [ -n "$SSH_CONNECTION" ] || ps aux | grep -v "grep" | grep -q "@$PS1_TTY"
then
  # SSH connection, different color and display host.
  if [ "`id -u`" = "0" ]
    then PS1_USER="$L_RED\u$RED@$L_RED\h"
    else PS1_USER="$L_GREEN\u$GREEN@$L_GREEN\h"
  fi
else
  # local, don't display host, but tty device.
  if [ "`id -u`" = "0" ]
    then PS1_USER="$L_RED\u$RED@$L_RED$PS1_TTY"
    else PS1_USER="$L_GREEN\u$GREEN@$L_GREEN$PS1_TTY"
  fi
fi

PS1_PATH="$L_BLUE\w"

# In case the git bash-completion script is already loaded, add it.
# If needed, source the script manaully before this one.
#  For Linux: /etc/bash_completion.d/git.sh
#  For OS X: /usr/local/git/contrib/completion/git-completion.bash
PS1_GIT=""
if [ "`type -t __git_ps1`" = "function" ]; then
  PS1_GIT="$GRAY\$(__git_ps1 \"(%s) \")$L_BLUE"
fi

PS1="$PS1_TITLE$PS1_USER $PS1_PATH $PS1_GIT\$ $RESET"
unset -v PS1_TTY PS1_TITLE PS1_USER PS1_PATH PS1_GIT

# Other magical prompts:
PS2='> '
PS4="$L_BLUE* exec: $RESET"

export PS1 PS2 PS4

