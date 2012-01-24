"
" Plugin: dirsettings
"
" Version: 1.0
"
" Description:
"
"   This is a simple plugin that allows per directory settings for your
"   favourite editor VIM. This plugin is mainly inspired by the already
"   existing plugin named dirsettings, see:
"
"   http://www.vim.org/scripts/script.php?script_id=1860
"
"   But this plugin goes a little step further. It walks the whole directory
"   tree up to the root and on its way back it sources each ".vimdir" file it
"   founds. This allows to overwrite specific settings even in subdirectories
"   which inherit the settings of each parent directory.
"
"   See readme.rst for details.
"
" Author: Christian Hammerl <info@christian-hammerl.de>
"

augroup dirsettings " {{{
    au BufNewFile * call dirsettings#init('BufNewFile')
    au BufEnter * call dirsettings#init('BufEnter')
augroup END " }}}


