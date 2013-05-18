func Del(part)
	let s:num = line('$')
	while(s:num)
		let s:str = getline(s:num)
		let s:num -= 1
		let s:str = substitute(s:str, a:part, '', '')
		call setline(s:num + 1, s:str)
		unlet s:str
	endwhile
	unlet s:num
	return
endfunc
	
