exec 'source ' . expand("<sfile>:p:h") . '/../../autoload/dirsettings.vim'
call dirsettings#Install('.vimrc', '.vim', 'dirsettings', expand("<sfile>:p:h"))
let g:dirsettingsVimRcVariable="set-by-vimrc"

filetype plugin indent on
