" for i in range(1, 4)
" 	echo "count is" i
" endfor

" function Fun()
" 	for i in range(1, 4)
" 		echo "count is" i
" 	endfor
" endfunction

function ConReplace()
		let val = getline('.')
		if val == "endfunction"
				echo val
" setline("endfunction", "test")
		endif 
		return
endfunction
