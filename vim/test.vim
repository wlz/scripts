function Expand()
	let fiType = split(getline("."))[1]
	echo fiType
"	if(match(fiType,"DATE") != -1)
"		append(".","DATE")
"	elseif(match(fiType,"VARCHAR") != -1)
"		append(".","STRING")
"	elseif(match(fiType,"NUMBER") != -1)
"		append(".","NUMBER")
"	endif
endfunction


