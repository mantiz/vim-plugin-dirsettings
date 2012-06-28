source ../../autoload/dirsettings.vim
call dirsettings#Install('.vimrc', '.vim', 'dirsettings', substitute(expand("<sfile>:p:h"), '/[^/]\+$', '', '') . '/data')
let g:dirsettingsVimRcVariable="set-by-vimrc"

filetype plugin indent on
