
VIM - Plugin - dirsettings
~~~~~~~~~~~~~~~~~~~~~~~~~~

:Author:  Christian Hammerl <info@christian-hammerl.de>
:Version: 1.0
:Updated: 2012-01-24

==================
Installation guide
==================

With pathogen:
==============

1. Change into the directory where pathogen expects your bundles::

    git clone <github-url> ./dirsettings.git

2. Add the following content at the top of your ``.vimrc`` (if you want to be
   able to modify the runtimepath before pathogen is invoked, it is important
   that this statement is executed before ``pathogen#infect`` is executed)::

    execute 'source ' . expand("<sfile>:p:h") . '/../bundle/dirsettings.git/plugin/dirsettings.vim'

The plugin places two autocommands (``BufNewFile, BufEnter``) with the
autocommand group `dirsettings`. It calls an internally used function to load
directory specific settings, deletes all autocommands of the group dirsettings
and recalls the event (``BufNewFile or BufEnter``) which then calls other
defined autocommands. This is because this has to be included at the very first
in your ``.vimrc``. These autocommands should be the very first which get
executed, otherwise it could happen that previously defined autocommands are
called twice.

===========
``.vimdir``
===========

This file can be used to customize your vim settings on a directory level.

To make a bundle available to pathogen for a specific directory just add the
directory of the bundle to your runtimepath::

    set runtimepath+=<path-to-your-bundle>

Because this way the runtimepath is modified before ``pathogen#infect`` is
called, pathogen properly loads the bundle for this directory.

