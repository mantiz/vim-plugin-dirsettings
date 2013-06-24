==========================
VIM - Plugin - dirsettings
==========================

:Author:  Christian Hammerl <info@christian-hammerl.de>
:Version: 2.0
:Updated: 2012-07-09

Description
===========

This is a simple plugin that allows per directory settings for your favourite
editor VIM. This plugin is mainly inspired by the already existing plugin named
dirsettings, see:

http://www.vim.org/scripts/script.php?script_id=1860

But this plugin goes a little step further. It walks the whole directory tree
up to the root and on its way back it sources each found ".vimrc".  This allows
to overwrite specific settings even in subdirectories which inherit the
settings of each parent directory. Furthermore if a .vim folder is found in one
of the parent directories it is added to the runtime path and therefore treated
as the .vim folder inside the home dir.

Additionally it checks for a ".vim/tags" file and appends it to the tag
list. This is better than a "tags" file in the current working directory
for source control reasons.

The plugin uses three autocommands (``BufNewFile, BufReadPre, BufWinEnter``)
with the autocommand group `dirsettings` (by default). It calls an internally
used function to load directory specific settings, and sets a flag for the own
autocommands so that they are not executed twice which would result in an
endless recursion. After the flag was set, the current event is recalled which
executes all other defined autocommands. This explains why the call to
``dirsettings#Install()`` should be the very first command in your ``.vimrc``.
Otherwise it could happen that previously defined autocommands are called
twice.

Installation
============

With pathogen:
--------------

This is the tested way to install and use the plugin, however it should work
with every other bundle manager or even without one.

1. Change into the directory where pathogen expects your bundles::

    git clone <github-url> ./dirsettings.git

2. Create a symbolic link to the autoload vimscript provided by this package::

    ln -s <path-of-this-package>/autoload/dirsettings.vim ~/.vim/autoload/

   Or copy the provided autoload vimscript into your autoload directory::

    cp <path-of-this-package>/autoload/dirsettings.vim ~/.vim/autoload/

2. Add the following content at the top of your ``.vimrc`` (if you want to be
   able to modify the runtimepath before pathogen is invoked, it is important
   that this statement is executed before ``pathogen#infect`` is executed)::

    call dirsettings#Install()

Tips and tricks
===============

1. In order to set directory specific settings, try to use always ``setlocal``
   instead of ``set``. Otherwise these settings will affect other buffers.

Known issues
============

Global settings affect all buffers
----------------------------------

It is perfectly fine to set global options within a per-directory-vimrc-file
but you have to understand that these global options will affect all buffers of
the currently running vim instance. As I know it is not possible to use global
options on a buffer level. Feel free to send me an email if you have any
suggestions to solve this issue.
However, if you want to use this plugin to run a vim instance inside a
directory which uses global per-directory-settings which are fine to affect all
buffers inside this vim instance and you run another vim instance inside
another directory which does not load these directory-settings, it works like a
charm.

Credits
=======

Thanks to `Jakob Westhoff`_ for adding support for .vim folders.

Thanks to `Jakob Westhoff`_ and `Tobias Schlitt`_ for adding some tests.

.. _`Jakob Westhoff`: https://github.com/jakobwesthoff/
.. _`Tobias Schlitt`: https://github.com/tobys/

