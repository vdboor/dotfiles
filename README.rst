Hi there!

These are my shell config files.
Feel free to use them, and take the useful stuff from it.

Diederik

Installation
============

Copy the files to the proper locations in ``/etc/``.

The VIM files might need to be copied to ``/usr/share/vim/`` instead.
See the instructions in the ``vimrc.local`` file, and fetch the submodules using::

    git submodule update --init

Mac OS X
--------

To apply all settings to your system::

    ./mac-defaults.sh

To copy all dotfiles::

    ./mac-copy.sh


Features
========

``bash.bashrc.local``:

* ``grep`` with colors
* ``git`` completion
* ``ls`` aliases
* ``colordiff`` alias
* enable prompt color

``profile.d/bash-prompt-color.sh``:

 prompt color script that features:

* Layouts::

    username@ttys002 ~/Path $
    username@ttys002 ~/Sites/example (master) $
    username@remote.example.com /srv/www $

* Differ for Local shell (shows tty) and remote SSH shell (shows hostname).
* Differ for Regular user (green prompt) or root user (red prompt).
* Add git branch/status in the prompt.
* Show Kubernetes context/namespace.

``.ackrc``:

* Ack settings for JSON, RST files.
* Ignore ``migrations`` and ``.idea`` (for Django projects).

``starship.toml``:

* prompt colors for all shells (install `starship <https://starship.rs/>`_).

``vimrc.local``:

* see comments in the file

``gitconfig``:

* colors
* aliases for ``git lg`` (log with graph), ``git staged``, ``git unstage``, etc..
* pager settings
* local dates
* ``github:`` prefix for ``git clone``.

``gitignore``:

* Use this as minimal ``/etc/.gitignore`` in case you'd like to track ``/etc/`` changes using git.

``gitignore_global``:

* Adds global ignores for temp files.

