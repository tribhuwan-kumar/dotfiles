set wildignore+=*/.git/**,*/.venv/**,*/dev/**,*/target/**,*/deps/**,*/_build/**,*/build/**,*/node_modules/**,*/__pycache__/**,*.json,*.lock,*.jpg,*.png,*.ico,*.jpeg,*.svg,*.ttf,*.woff,*.woff2

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

  let l:rg_cmd = 'rg -F ' . l:rg_flags . ' ' . l:pattern . ' ' . l:file_pattern_cmd

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

function! SearchPatternInFile()
	let l:pattern = ''
  if mode() =~# 'v' || mode() =~# 'V'
    normal! "zy
		let l:pattern = escape(@z, '/\')
	else
		let l:pattern = expand("<cword>") " if its not visual, treat as word
	endif
	let l:filename = expand("%")
	let l:vimgrepcmd = printf(":Vrg /%s/ %s", l:pattern, l:filename)
	execute l:vimgrepcmd
endfunction

function! SearchPatternInSameExt()
	let l:pattern = ''
  if mode() =~# 'v' || mode() =~# 'V'
    normal! "zy
		let l:pattern = escape(@z, '/\')
	else
		let l:pattern = expand("<cword>")
	endif
	let l:extension = expand("%:e")
	let l:vimgrepcmd = printf(":Vrg /%s/ **/*.%s", l:pattern, l:extension)
	execute l:vimgrepcmd
endfunction

function! SearchPatternInProject()
	let l:pattern = ''
  if mode() =~# 'v' || mode() =~# 'V'
		normal! "zy
		let l:pattern = escape(@z, '/\')
	else
		let l:pattern = expand("<cword>")
	endif
	let l:vimgrepcmd = printf(":Vrg /%s/", l:pattern) " no need to pass getcwd()
	execute l:vimgrepcmd
endfunction

nnoremap co :copen<CR>
nnoremap cq :cclose<CR>
nnoremap cn :cnext<CR>
nnoremap cm :cprevious<CR>
nnoremap sw <cmd>call SearchPatternInFile()<CR>
nnoremap sp <cmd>call SearchPatternInSameExt()<CR>
nnoremap sP <cmd>call SearchPatternInProject()<CR>
vnoremap sw <cmd>call SearchPatternInFile()<CR>
vnoremap sp <cmd>call SearchPatternInSameExt()<CR>
vnoremap sP <cmd>call SearchPatternInProject()<CR>
command! -nargs=+ Vrg call VimgrepRg(<q-args>)
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=* RG call fzf#vim#grep2("rg --column --line-number --no-heading --color=always --smart-case -- ", <q-args>, fzf#vim#with_preview(), <bang>0)
