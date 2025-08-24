set wildignore+=*\.git\**,*\.venv\**,*\dev\**,*\target\**,*\deps\**,*\_build\**,*\node_modules\**,*\__pycache__\**,*.json,*.lock,*.jpg,*.png,*.ico,*.jpeg,*.svg,*.ttf

function! VimgrepRg(args)
  let l:match = matchlist(a:args, '^/\(.\{-}\)/\([gfj]*\)\s*\(.*\)$')
  if empty(l:match)
    echohl ErrorMsg | echo "Invalid syntax. Use :Vrg /pattern/[flags] {file_pattern}" | echohl None
    return
  endif

  let l:pattern = l:match[1]
  let l:flags = l:match[2]
  let l:file_pattern = l:match[3]

  let l:pattern = '"' . escape(l:pattern, '"') . '"'
  let l:rg_flags = '--vimgrep'

  if stridx(l:flags, 'g') >= 0
    let l:rg_flags .= ' --no-heading'
  endif

  let l:file_pattern_cmd = ''
  if !empty(l:file_pattern)
    let l:file_pattern_cmd = '--glob "' . escape(l:file_pattern, '"') . '"'
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

function SearchWordInProject()
	let l:word = ''
	if mode() =~# 'v'
		let l:old_reg = getreg('"')
		normal! gv"zy
		let l:word = escape(@z, '/\')
		call setreg('"', l:old_reg)
	else
		let l:word = expand("<cword>")
	endif
	let l:vimgrepcmd = printf(":Vrg /%s/", l:word) " no need to pass getcwd()
	execute l:vimgrepcmd
endfunction

nnoremap co :copen<CR>
nnoremap cq :cclose<CR>
nnoremap cn :cnext<CR>
nnoremap cm :cprevious<CR>
nnoremap sw :call SearchWordInFile()<CR>
nnoremap sp :call SearchWordInSameExt()<CR>
nnoremap sP :call SearchWordInProject()<CR>
vnoremap sw :<C-u>call SearchWordInFile()<CR>
vnoremap sp :<C-u>call SearchWordInSameExt()<CR>
vnoremap sP :<C-u>call SearchWordInProject()<CR>
command! -nargs=+ Vrg call VimgrepRg(<q-args>)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RG call fzf#vim#grep2("rg --column --line-number --no-heading --color=always --smart-case -- ", <q-args>, fzf#vim#with_preview(), <bang>0)
