let s:tags_before = &tags

edit ../data/directory-only/tags/empty

if (&tags == s:tags_before . ',' . $HOME . '/directory-only/tags/.vim/tags')
	echo "tags successfull appended"
endif

quit!
