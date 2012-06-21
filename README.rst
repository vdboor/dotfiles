Hi there!

These are my shell config files.
Feel free to use them, and take the useful stuff from it.

Diederik

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

* Differ for Local shell (shows tty) and remote SSH shell (shows hostname)
* Differ for Regular user (green prompt) or root user (red prompt)
* Add git branch/status in the prompt

``vimrc.local``:

* see comments in the file

``gitconfig``:

* colors
* aliases for ``git lg`` (log with graph), ``git staged``, ``git unstage``, etc..
* pager settings
* local dates
* ``github:`` prefix for ``git clone``.

``gitignore``:

* useful to place ``/etc/`` into git, this is the minimal ``/etc/.gitignore`` to use.

