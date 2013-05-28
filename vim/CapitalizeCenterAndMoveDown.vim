function! CapitalizeCenterAndMoveDown()
	s/\<./\u&/g
	center
	+1
endfunction

nmap <silent> \C :call CapitalizeCenterAndMoveDown()<CR>
