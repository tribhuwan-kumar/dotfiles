set wildignore+=*/.git/**,*/.venv/**,*/dev/**,*/target/**,*/deps/**,*/_build/**,*/node_modules/**,*/__pycache__/**,*.json,*.lock,*.jpg,*.png,*.ico,*.jpeg,*.svg,*.ttf

function SearchWordInFile()
	let l:word = ''
  if mode() =~# 'v'
    let l:old_reg = getreg('"')
    normal! gv"zy
		let l:word = escape(@z, '/\')
		call setreg('"', l:old_reg)
	else
		let l:word = expand("<cword>")
	endif
	let l:filename = expand("%")
	let l:vimgrepcmd = printf(":Vrg /%s/ %s", l:word, l:filename)
	execute l:vimgrepcmd
endfunction

function SearchWordInSameExt()
	let l:word = ''
	if mode() =~# 'v'
		let l:old_reg = getreg('"')
		normal! gv"zy
		let l:word = escape(@z, '/\')
		call setreg('"', l:old_reg)
	else
		let l:word = expand("<cword>")
	endif
	let l:extension = expand("%:e")
	let l:vimgrepcmd = printf(":Vrg /%s/ **/*.%s", l:word, l:extension)
	execute l:vimgrepcmd
endfunction

function ReplaceWordInFile()
	let l:word = ''
	if mode() =~# 'v'
		let l:old_reg = getreg('"')
		normal! gv"zy
		let l:word = escape(@z, '/\')
		call setreg('"', l:old_reg)
	else
		let l:word = expand("<cword>")
	endif
	let l:filename = expand("%")
	let l:extension = expand("%:e")
	let l:replacementWord = input("Enter the replacement word: ")
	if l:replacementWord!= ''
		let l:vimgrepcmd = printf(":Vrg /%s/ %s | cdo s/%s/%s/g | w", l:word, l:filename, l:word, l:replacementWord)
		silent execute l:vimgrepcmd
		echo "Replaced '". l:word. "' with '". l:replacementWord. "'"
	else
		echo "No replacement word provided!"
	endif
endfunction

function ReplaceWordInSameExt()
	let l:word = expand("<cword>")
	let l:extension = expand("%:e")
	let l:replacementWord = input("Enter the replacement word: ")
	if l:replacementWord != ''
		let l:vimgrepcmd = printf(":Vrg /%s/ **/*.%s | cdo s/%s/%s/g | w", l:word, l:extension, l:word, l:replacementWord)
		silent execute l:vimgrepcmd
		echo "Replaced '". l:word. "' with '". l:replacementWord "'" . "in whole project"
	else
		echo "No replacement word provided"
	endif
endfunction

function! VimgrepRg(args)
  let l:match = matchlist(a:args, '^/\(.\{-}\)/\([gfj]*\)\s*\(.*\)$')
  if empty(l:match)
    echohl ErrorMsg | echo "Invalid syntax. Use :Vrg /pattern/[flags] {file_pattern}" | echohl None
    return
  endif

  let l:pattern = l:match[1]
  let l:flags = l:match[2]
  let l:file_pattern = l:match[3]

  let l:pattern = '"' . l:pattern . '"'
  let l:rg_flags = '--vimgrep'

  if stridx(l:flags, 'g') >= 0
    let l:rg_flags .= ' --no-heading'
  endif

  if l:file_pattern ==# '%'
    let l:file_pattern_cmd = '-- ' . expand('%:p')
  elseif empty(l:file_pattern)
    let l:file_pattern_cmd = ''
  else
    let l:file_pattern_cmd = join(map(split(l:file_pattern), '"--glob " . v:val'), ' ')
  endif

  let l:rg_cmd = 'rg ' . l:rg_flags . ' ' . l:pattern . ' ' . l:file_pattern_cmd

  let l:results = systemlist(l:rg_cmd)

  if v:shell_error
    echohl ErrorMsg | echo "Ripgrep Error: " . v:shell_error | echohl None
  else
    call setqflist([], 'r', {'title': 'Vrg', 'lines': l:results})
    let l:qflist = getqflist()
    if !empty(l:qflist)
      let l:first_result = l:qflist[0]
      echo printf("(%d of %d): %s", 1, len(l:qflist), l:first_result.text)
    else
      echo "No matches found"
    endif
    if stridx(l:flags, 'j') >= 0
      cfirst
    endif
  endif
endfunction

command! -nargs=1 Vrg call VimgrepRg(<q-args>)

nnoremap sw :call SearchWordInFile()<CR>
nnoremap sp :call SearchWordInSameExt()<CR>
vnoremap sw :<C-u>call SearchWordInFile()<CR>
vnoremap sp :<C-u>call SearchWordInSameExt()<CR>

nnoremap fw :call ReplaceWordInFile()<CR>
nnoremap fp :call ReplaceWordInSameExt()<CR>
nnoremap co :copen<CR>
nnoremap cq :cclose<CR>
nnoremap cn :cnext<CR>
nnoremap cm :cprevious<CR>

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RG call fzf#vim#grep2("rg --column --line-number --no-heading --color=always --smart-case -- ", <q-args>, fzf#vim#with_preview(), <bang>0)
