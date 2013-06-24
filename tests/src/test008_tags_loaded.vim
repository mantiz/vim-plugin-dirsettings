edit ../data/directory-only/tags/empty

if (&tags == './tags,./TAGS,tags,TAGS,' . $HOME . '/directory-only/tags/.vim/tags')
	echo "tags successfull appended"
endif

quit!
