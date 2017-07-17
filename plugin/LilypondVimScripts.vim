

function! CommentToTimeSignature ()
	call search('time\>' , 'bs')
	call search('%bn' , 'b,)
	execute "normal k"
	let bottomline = prevnonblank( line ('.'))
	let barone = search('bn1\>' , 'bn')
	exe barone.",".bottomline "call TempComment()"
	exe "normal ``"
endfunction

function! CommentToEnd ()
	exe "normal }}}"
	let topline = nextnonblank( line('.'))
	let bottomline = search('bnEND' , 'bn')
	exe topline . "," . bottomline "call TempComment()"
endfunction

function! CompileSection ()
	exe "normal mz"
	call CommentToTimeSignature ()
	call CommentToEnd ()
	exe "normal `z:w<CR>"
	exe "w\|!tmux new -d,, \"lilypond % %\""
" map <F5> :w<bar>:!tmux new -d,, "lilypond -o=<C-R>% <C-R>% "<CR> <ENTER> 
endfunction

function! Compile()
	exe "w\|!tmux new -d,, \"lilypond % %\""
endfunction

function! RemoveSelection ()
	exe "silent normal mz"
	call search ("aralle","bw")
	call search ("%bn","")
	exe "normal k"
	call StartHere()
	exe "normal G"
	call search ("%bn","b")
	exe "normal j"
	call EndHere()
	exe "silent normal `z"
endfunction

function! GetTimeSignature ()
	let t = getline (search('\\time\>' , 'bn'))
	let sig = matchstr(t , '\d*/\d*')
	return sig
endfunction

function! GetInstrumentList ()
	let t = getline (search('parallel','bn'))
	let instruments = matchstr(t,"\([^\)]*")
	let instrumentList = split(instruments)
	return instrumentList
endfunction

function! GetNumberofInstruments ()
	let instrumentList = GetInstrumentList ()
	let num = len(instrumentList) - 1
	return num
endfunction

let g:rests = { "1/4":"R4" , '2/4':'R2' ,'3/4':'R2.' , '4/4':'R1' , '5/4':'r2. r2' , '6/4':'R1.' , '7/4':'r1 r2.' ,
			\'1/8':'R8' , '2/8':'R4' , '3/8':'R4.' , '4/8':'R2' , '5/8':'r4. r4' , '6/8':'R2.' ,
			\'7/8':'r2 r4.' , '8/8':'R1' , '9/8':'r4. r r' , 
			\'3/16':'R8.' , '6/16':'r8. r' , '9/16':'r8. r r' ,
			\ '2/2':'R1' , '3/2':'R1.' }

let g:spacers = { "1/4":"s4" , '2/4':'s2' ,'3/4':'s2.' , '4/4':'s1' , '5/4':'s2. s2' , '6/4':'s1.' , '7/4':'s1 s2.' ,
			\'1/8':'s8' , '2/8':'s4' , '3/8':'s4.' , '4/8':'s2' , '5/8':'s4. s4' , '6/8':'s2.' ,
			\'7/8':'s2 s4.' , '8/8':'s1' , '9/8':'s4. s s' , 
			\'3/16':'s8.' , '6/16':'s8. s' , '9/16':'s8. s s' ,
			\ '2/2':'s1' , '3/2':'s1.' }

function! InsertRests ()
	let correctRests = get( g:rests , GetTimeSignature() )
	if virtcol('.')==1
		exe "normal i" . correctRests . " "
	else
		execute "normal a ".correctRests." "
	endif
	return correctRests
endfunction

function! InsertSpacers ()
	let correctSpacers = get( g:spacers , GetTimeSignature() )
	if virtcol('.')==1
		exe "normal i" . correctSpacers . " "
	else
		execute "normal a ".correctSpacers." "
	endif
	return correctSpacers
endfunction

function! PreviousBarThisInstrument ()
	let i = 0
	let insnum = GetNumberofInstruments()
	while i < insnum 
		call search ( "|" , 'b' )
		let i = i + 1
	endwhile
	if search ( "|" , "b" , line(".") )
		execute "normal l"
	else 
		execute "normal ^"
	endif
endfunction

function! NextBarThisInstrument ()
	let i = 0
	let insnum = GetNumberofInstruments()
	while i < insnum + 1
		call search ( "|" , "" )
		let i = i + 1
	endwhile
	if search ( "|" ,  "b", line(".") )
		execute "normal l"
	else 
		execute "normal ^"
	endif
endfunction

function! AddInstrument ()
	execute "normal m'"
	let newInstrument = input("new instrument name?")
	let insertAfter =   input("input after?")
	" add to instrument list
	call search ("aralle","bw")
	call search (insertAfter,"")
	exe "silent! normal! ea " . newInstrument
	" add bars and  rests
 	let num = InstrumentNumber(insertAfter)
 	while search ("%bn\\d",'W')
 		let i = 0
 		while i < (num) 
			let i = i + 1
			call search ("|","W")
		endwhile
		exe "silent! normal a,, ,r |"
		exe "silent! normal! \<ESC>"
		"add label
		call search (insertAfter,"W")
		exe "silent normal ea " . newInstrument . " \<ESC>"
	endwhile
	exe "normal ``"
endfunct

function! AddInstrumentList (instrumentList)
	execute "normal m'"
	let insertAfter =   input("input after?")
	" add to instrument list
	call search ("aralle","bw")
	exe 's/(\(\S\)/( \1/'
	call search (insertAfter,"")
	exe "silent normal e"
	for inst in a:instrumentList 
		exe "silent! normal! a,, " . inst 
	endfor
	" add bars and  rests
	let num = InstrumentNumber(insertAfter)
	while search ("%bn\\d",'W')
		let i = 0
		while i < (num) 
			let i = i + 1
			call search ("|","W")
		endwhile
		for inst in a:instrumentList
			exe "silent! normal a, ,r |"
			exe "silent! normal! \<ESC>"
		endfor
		"add label
		call search(insertAfter,"W")
		exe "silent normal e"
		for inst in a:instrumentList 
			exe "silent! normal! a, " . inst 
		endfor
	endwhile
	exe "normal ``"
endfunct

function! AddCR(...)
	exe "normal m`"
	if a:0 == 0
		let after = input("CR after?")
	else
		let after = a:1
	endif
 	let num = InstrumentNumber(after)
	call search ("allel","w")
	while search ("%bn\\d","W")
 		let i = 0
 		while i < (num) 
			let i = i + 1
			call search ("|","W")
		endwhile
		exe "silent normal w\"adt%\<ESC>"
		call search (after,"")
		exe "silent normal w\"bd$"
		exe "silent normal o\<ESC>\"apa% \<ESC>\"bp=="
	endwhile
endfunction

function! RemoveStrayBarlines()
	exe '%s/\(%.*\)|/\1bar/gc'
endfunction

function! AddBarNums ()
	call RemoveStrayBarlines()
	call RemoveStrayBarlines()
	call search ("allel","bw")
	call search ("{","")
	exe "silent normal o\<ESC>o%bn1"
	let num = GetNumberofInstruments()
	let barnum = 1
	while search("|","W")
		let i = 2
		while i < num
			call search("|","W")
			let i = i + 1
		endwhile
		let barnum = barnum + 1
		exe "silent normal o\<ESC>0"
		call search("\\S","W")
		exe "silent normal O%bn" . barnum
	endwhile
endfunction

function! RenumberBars ()
	call search ("allel","bw")
	call search ("{","")
	let barnum = 1
	while search("%bn","W")
		exe "silent normal cw%bn" . barnum
		let barnum = barnum + 1
	endwhile
endfunction

function! SearchNotes ()
	execute 'normal! /\<[a-g]\(is\|es\|\s\|\d,\|,\|' . "'" . '\|)\|>\|\\\|}\)' . "\<CR>"
endfunction

function! CountInstrumentsonLine ()
	let nmatches = len(split(getline('.'), '|', 1)) - 1
	return nmatches
endfunction

function! InstrumentNumber (inst)
	let instList = GetInstrumentList()
	echo match(instList , a:inst )
	return match(instList , a:inst )
endfunction

function! JumptoInstrument ()
	let g:inst = input("inst?")
	let num = InstrumentNumber(g:inst)
	call search ("%bn",'b')
	let i = 0
	while i < num
		call search ('|','')
		let i = i + 1
	endwhile
	call PrevBar()
	exe "silent! normal! l"
endfunction

function! JumptoInstrumentNonInteractive (inst)
	let num = InstrumentNumber(a:inst)
	call search ("%bn",'b)
	let i = 0
	while i < num
		call search ('|','')
		let i = i + 1
	endwhile
	call PrevBar()
	exe "silent! normal! l"
endfunction

function! JumpAgain ()
	let num = InstrumentNumber(g:inst)
	call search ("%bn",'b')
	let i = 0
	while i < num
		call search ('|','')
		let i = i + 1
	endwhile
	call PrevBar()
	exe "silent! normal! l"
endfunction


function! AddOctave ()
	execute 'normal! /\A' . "\<CR>"
	let octave = matchstr(getline('.'), '\%' . col('.') . 'c.')
	if octave == "," 
		execute "normal x" 
	else
		execute "normal i'\<ESC>"
	endif
	execute 'silent! normal! /\<[a-g]\(is\|es\|\s\|\d\|,\|' . "'" . '\|)\|>\|\\\|}\)' . "\<CR>"
endfunction

function! SubtractOctave ()
	execute 'silent! normal! /\A' . "\<CR>"
	let octave = matchstr(getline('.'), '\%' . col('.') . 'c.')
	if octave == "'" 
		execute "normal x"
	else
		execute "normal i,\<ESC>"
	endif
	execute 'silent! normal! /\<[a-g]\(is\|es\|\s\|\d\|,\|' . "'" . '\|)\|>\|\\\|}\)' . "\<CR>"
endfunction


function! PrevBar()
	let char = matchstr(getline('.'), '\%' . col('.') . 'c.')
	if char == "|"
		execute "silent! normal! h"
	endif
	execute 'silent! normal! f|h?\(|\|^\)' . "\<CR>"
endfunction

function! NextBar()
	execute 'silent! normal! /\(|\|^\)' . "\<CR>"
endfunction

function! SelectBar()
	call PrevBar()
	let char = matchstr(getline('.'), '\%' . col('.') . 'c.')
	if char == "|" 
		execute "normal l"
	endif
	execute "normal vt|"
endfunction

function! StartHere()
	call search("aralle","bws")
	call search("%}","")
	execute 'silent! normal! dd``p'
endfunction

function! SetRange(start, end)
	call search("aralle","bws")
	let charstart = "%bn" . a:start 
	call search (charstart,"")
	call search('time\>' , 'bs') " go back to prev TS
	call search('%bn' , 'b')
	call StartHere()
	let charend = "%bn" . a:end 
	call search (charend,"")
	call EndHere()
endfunction

function! SetRangeBySection(start, end)
	call search("aralle","bws")
	let charstart = "%sec" . a:start 
	call search (charstart,"")
	call StartHere()
	let charend = "%sec" . a:end 
	call search (charend,"")
	call EndHere()
endfunction

function! EndHere()
	call search("aralle","bws")
	call search("%{","")	
	call search("%{","")	
	execute 'silent! normal! dd``p'
endfunction

function! StartAtTimeSignature ()
	call search('time\>' , 'bs')
	call search('%bn' , 'b')
	execute "normal k"
	call StartHere()
	exe "normal ``"
endfunction

function! EndThreeBarsLater()
	execute "normal mz"
	execute "normal }}}"
	call EndHere()
	execute "normal `z"
endfunction

function! SetSection()
	execute "normal mz"
	call search('time\>' , 'bs')
	call search('%bn' , 'b')
	execute "normal k"
	call StartHere()
	execute "normal `z"
	execute "normal }}}"
	call EndHere()
	execute "normal `z"
endfunction

function! Flags(scoreopts)
	let g:flags=a:scoreopts
endfunction

function! Sco()
	exe '!./sco -' . g:flags . ' %'
endfunction


function! GetFromInstrument()
	let inst = input("from inst?")
	exe "normal mz"
	call JumptoInstrumentNonInteractive(inst)
	exe "normal  yab`zvabp"
endfunction

""""""""""""""""
""" Quoting """"
""""""""""""""""

function! Quote()
	let inst = input("inst ?")
	exe "normal mz"
	call SelectBar()
	exe "normal yo\<ESC>p"
 	s/\cr/s/g
	exe "normal y$`z"
	call SelectBar()
	exe "normal pjdd`z"
	call SelectBar()
	exe "normal S}"
	exe 'normal i\Q #"' . inst . '" '
endfunction

function! QuoteWithArg(instr)
	let inst=a:instr
	call SelectBar()
	exe "normal yo\<ESC>p"
 	s/\cr/s/g
	exe "normal y$`z"
	call SelectBar()
	exe "normal pjdd`z"
	call SelectBar()
	exe "normal S}"
	exe 'normal i\Q #"' . inst . '" '
endfunction

function! ChangeAndQuote()
	let inst = input("inst ?")
	exe "normal mz"
	call SelectBar()
	exe "normal yo\<ESC>p"
 	s/\cr/s/g
	exe "normal y$`z"
	call SelectBar()
	exe "normal pjdd`z"
	call SelectBar()
	exe "normal S}"
	exe 'normal i \instrumentSwitch "' . inst . '" \Q #"' . inst . '" '
endfunction

function! ContinueQuoteSingle()
	exe 'normal mf'
	call PreviousBarThisInstrument()
	call SelectBar()
	exe 'normal y'
	call NextBarThisInstrument()
	call SelectBar()
	exe 'normal p'
	exe 'normal F{lci{'
	call InsertSpacers()
	exe 'normal me'
	call SelectBar()
	exe "normal yo"
	exe "normal p"
	exe ':silent! s/\\instrumentSwitch "[a-z]*"//g'
	exe 'normal 0d$`e'
	call SelectBar()
	exe 'normal pjdd`f'
endfunction

function! ContinueQuote()
	call PreviousBarThisInstrument()
	call SelectBar()
	exe 'normal y'
	call NextBarThisInstrument()
	call SelectBar()
	exe 'normal p'
	exe 'normal F{lci{'
	call InsertSpacers()
endfunction

function! ContinueQuoteLine()
	exe 'normal 0'
	let i = 1
	while i<7
		call ContinueQuote()
		exe 'normal f|l'
		let i = i + 1
	endwhile
	exe 'normal V'
	exe ':silent! s/\\instrumentSwitch "[a-z]*"//g'
	exe "normal \<ESC>"
endfunction

"function! SwitchInstrumentAndQuote()
"	let inst = input("new inst?")
"	exe 'normal cab \QQ "' . inst . '"'
"endfunction
"

"""""""""""""""""""""""""""""""""""""""""""""""
"""" js arranger '''''''''''''''''''''''''''''
"""""""""""""""""""""""""""""""""""""""""""""""

map ,ar {V}y}PV}:!node gmo-node.js<ENTER>




""""""""""""""" Maps """""""""""""""""""""""
map <Leader>q :call Quote()<CR>
map <Leader>cq :call ContinueQuoteSingle()<CR>
map <Leader>ch :call ChangeAndQuote()<CR>
map <Leader>con :call ContinueQuoteLine()<CR>
map <Leader>r :call InsertRests()<CR>
imap <Leader>r <ESC>:call InsertRests()<CR>i
map <Leader>k :call PreviousBarThisInstrument() <CR>
map <Leader>j :call NextBarThisInstrument() <CR>
map <Leader>g,, :call GetFromInstrument()<CR>
map <C-k> :call AddOctave()<CR>
map <C-j> :call SubtractOctave()<CR>
map <C-l> :call SearchNotes()<CR>
au Filetype lilypond       map <C-b> :call SelectBars()<CR>
map ,, :call SetSection()<CR>
map ,< :call RemoveSelection()<CR>
map ,<Space> :!osascript ~/scripts/SendKeystoREAPER.applescript<CR>
map ,comp :call Compile()<CR>
map ,m ,comp<CR>
map <C-g> :call JumpAgain()<CR>
map <C-f> :call JumptoInstrument()<CR>
map ,f :call    JumptoInstrument()<CR>
map <C-d> cab,r<ESC>
map <Leader>b :call PrevBar()<CR>l
map <Leader>e :call NextBar()<CR>h
map <Leader>A :call StartHere()<CR>
map <Leader>Z :call EndHere()<CR>
map <Leader>s :call Sco()<CR>
map <Leader>rpr :!rpr reaper/Vocal.RPP &<CR>

