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

if (exists('g:dirsettings_loaded'))
	finish
endif
let g:dirsettings_loaded = 1

function dirsettings#install(...)
	let l:fname = a:0 > 0 ? a:1 : '.vimdir'
	let l:augroup = a:0 > 1 ? a:2 : 'dirsettings'

	execute 'augroup ' . l:augroup
		au!
		execute 'au BufNewFile * : call s:prepareBuffer(''BufNewFile'', ''' . l:fname . ''')'
		execute 'au BufEnter * : call s:prepareBuffer(''BufEnter'', ''' . l:fname . ''')'
	augroup END
endfunction

function s:prepareBuffer(event, fname)
	if (exists('b:dirsettings_prepared'))
		return
	endif

	let b:dirsettings_prepared = 1
	call s:loadDirectorySettings(a:fname)
	execute 'doautocmd ' . a:event . ' <buffer>'
endfunction

function s:loadDirectorySettings(fname, ...)
	let l:here = a:0 > 0 ? a:1 : expand('%:p:h')
	if (strlen(l:here) > 0)
		let fr = match(l:here, '/[^/]*$')
		if (fr > -1)
			call s:loadDirectorySettings(a:fname, strpart(l:here, 0, fr))
		endif
	endif
	if (filereadable(l:here . '/' . a:fname))
		exec 'source ' . l:here . '/' . a:fname
	endif
endfunction

