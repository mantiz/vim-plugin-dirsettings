
VIM - Plugin - dirsettings
~~~~~~~~~~~~~~~~~~~~~~~~~~

:Author:  Christian Hammerl <info@christian-hammerl.de>
:Version: 1.0
:Updated: 2012-01-24

===========
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

==================
Installation guide
==================

With pathogen:
==============

1. Change into the directory where pathogen expects your bundles::

    git clone <github-url> ./dirsettings.git

2. Create a symbolic link to the autoload vimscript provided by this package::

    ln -s <path-of-this-package>/autoload/dirsettings.vim ~/.vim/autoload/

   Or copy the provided autoload vimscript into your autoload directory::

    cp <path-of-this-package>/autoload/dirsettings.vim ~/.vim/autoload/

2. Add the following content at the top of your ``.vimrc`` (if you want to be
   able to modify the runtimepath before pathogen is invoked, it is important
   that this statement is executed before ``pathogen#infect`` is executed)::

    call dirsettings#install()

The plugin places two autocommands (``BufNewFile, BufEnter``) with the
autocommand group `dirsettings`. It calls an internally used function to load
directory specific settings, and sets a flag for the own autocommands so that
they are not executed twice which would result in an endless recursion. After
the flag was set, the current event is recalled which resets the flag (for
another event) and calls all other defined autocommands. This is because this
has to be included at the very first in your ``.vimrc``. These autocommands
should be the very first which get executed, otherwise it could happen that
previously defined autocommands are called twice.

