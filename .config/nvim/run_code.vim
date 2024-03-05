" Check os and shell
function! GetShell(command)
    let escaped_command = shellescape(a:command, 2)

    if has('unix')
        let shell = substitute(system('basename $SHELL'), '\n', '', '')

        if shell ==# "bash"
            call RunTerminal(escaped_command, 'bash')
        elseif shell ==# "zsh"
            call RunTerminal(escaped_command, 'zsh')
        elseif shell ==# "fish"
            call RunTerminal(escaped_command, 'fish')
        elseif shell ==# "sh"
            call RunTerminal(escaped_command, 'sh')
        elseif shell ==# "ksh"
            call RunTerminal(escaped_command, 'ksh')
        elseif shell ==# "csh"
            call RunTerminal(escaped_command, 'csh')
        elseif shell ==# "tcsh"
            call RunTerminal(escaped_command, 'tcsh')
        elseif shell ==# "dash"
            call RunTerminal(escaped_command, 'dash')
        elseif shell ==# "ash"
            call RunTerminal(escaped_command, 'ash')
        elseif shell ==# "busybox"
            call RunTerminal(escaped_command, 'busybox')
        elseif shell ==# "kitty"
            call RunTerminal(escaped_command, 'kitty')
        else
            let g:shell = "Not supported shell"
            echo g:shell
        endif
    else
        let g:os = "Not supported"
        echo g:os
    endif

endfunction

" set initial buffer
let s:terminal_bufnr = -1
" Run terminal command based on shell
function! RunTerminal(command, shell)

    if s:terminal_bufnr == -1
        execute "vsplit | terminal"
        let s:terminal_bufnr = bufnr('%')
          

        " if &buftype ==# 'terminal' || &buftype ==# 'term'
        " endif
        " execute "vsplit | term " . a:shell . " -c " . a:command . ";exec " . a:shell
        " execute "vsplit | terminal"
        " terminal 
    elseif &buftype ==# 'terminal' || &buftype ==# 'term'
        execute 
        let term_win_id = bufwinnr(s:terminal_bufnr)
        if term_win_id != -1
            
            " for win in range(1, winnr('$'))
            "     if winbufnr(win) == s:terminal_bufnr
            "         let term_win_id = win
            "         break
            "     endif
            " endfor

            call ClearTerminal()
            execute term_win_id . "wincmd w"
            " let s:select_win = term_win_id . "wincmd w"
            execute "term " . a:shell . " -c " . a:command . ";exec " . a:shell
            call feedkeys("\<Esc>")
        
        else
            execute "vsplit | term " . a:shell . " -c " . a:command . ";exec " . a:shell
            let s:terminal_bufnr = bufnr('%')
        endif
    endif
endfunction

function! FindTerminalWindowBuffer()
  for buf in range(1, bufnr('$'))
    if bufexists(buf) && getbufvar(buf, '&buftype') == 'terminal'
      let term_buf = buf
      break
    endif
  endfor


  function! CycleTerminalBuffers()
    let l:buffers = filter(range(1, bufnr('$')), 'getbufvar(v:val, "&buftype") ==# "terminal" && buflisted(v:val)')
    if len(l:buffers) == 0
        echo "No terminal buffers found"
        return
    endif

    let l:current = bufnr('')
    let l:nextIndex = index(l:buffers, l:current) + 1

    " Wrap around if needed
    if l:nextIndex >= len(l:buffers)
        let l:nextIndex = 0
    endif

    let l:nextBuf = l:buffers[l:nextIndex]
    execute 'buffer' l:nextBuf
endfunction


  if exists('term_buf')
    echo "Terminal window found with buffer number: " . term_buf
    " Here you can add code to use this terminal window for showing output
  else
    echo "No terminal window found."
  endif
endfunction



" Handle terminal window closure
" augroup TerminalWindow
"     autocmd!
"     autocmd TermClose * let s:terminal_bufnr = -1
" augroup END


" Pass run command
 function! CodeRun()
     let l:ext = expand("%:e") 
     let l:fullpath = expand("%:p") 
     let l:filename = expand("%:t:r")

     if l:ext == "py"
         call GetShell("python -u " . shellescape(l:fullpath)) 
     elseif l:ext == "js"
         call GetShell("node " . shellescape(l:fullpath))
     elseif l:ext == "ts"
         call GetShell("ts-node " . shellescape(l:fullpath))
     elseif l:ext == "tsx"
         call GetShell("ts-node " . shellescape(l:fullpath))
     elseif l:ext == "c" || l:ext == "cpp"
         let compile_command = l:ext == "c" ? 'gcc' : 'g++'
         let compile_command .= ' ' . shellescape(l:fullpath)
         let compile_command .= ' -o ' . shellescape('./' . l:filename)
         let run_command = './' . shellescape(l:filename)
         call GetShell(compile_command . " && " . run_command)
     elseif l:ext == "java"
         let compile_command = "javac " . shellescape(l:fullpath)
         let run_command = "java " . shellescape(l:filename)
         call GetShell(compile_command . " && " . run_command)
         " call GetShell("javac " . shellescape(l:fullpath) . " && java " . shellescape(l:filename))
     elseif l:ext == "go"
         call GetShell("go run " . shellescape(l:fullpath))
     elseif l:ext == "rs"
         call GetShell("rustc " . shellescape(l:fullpath) . " && " . shellescape('./' . l:filename))
     elseif l:ext == "php"
         call GetShell("php " . shellescape(l:fullpath))
     elseif l:ext == "lua"
         call GetShell("lua " . shellescape(l:fullpath))
     elseif l:ext == "sh"
         call GetShell("bash " . shellescape(l:fullpath))    
     else
         call GetShell("echo 'Not supported filetype'")
     endif
 endfunction

command! CheckCode call CodeRun()


" Define a function to clear the terminal buffer
function! ClearTerminal()
  set scrollback=1
  call feedkeys("\i")
  call feedkeys("clear\<CR>")
  call feedkeys("\<C-\>\<C-n>")
  call feedkeys("\i")
  sleep  100m
  let &scrollback=10000
endfunction

" Map a key combination to call the ClearTerminal function
command! ClearTerminal call ClearTerminal()

" function! ClearTerminal()
"   set scrollback=1
"   call feedkeys("clear\<CR>", 't')
"   sleep   100m
"   let &scrollback=10000
" endfunction

function! FindTerminalWindowBuffer()
  for buf in range(1, bufnr('$'))
    if bufexists(buf) && getbufvar(buf, '&buftype') == 'terminal' || getbufvar(buf, '&buftype') == 'term'
      let term_buf = buf
      break
    endif
  endfor

  if exists('term_buf')
    echo "Terminal window found with buffer number: " . term_buf
    " Here you can add code to use this terminal window for showing output
  else
    echo "No terminal window found."
  endif
endfunction
command! FindTerminal call FindTerminalWindowBuffer()


" function! FindTerminalWindowBuffer()
"   for buf in range(1, bufnr('$'))
"     if bufexists(buf) && getbufvar(buf, '&buftype') == 'terminal'
"       let term_buf = buf
"       break
"     endif
"   endfor

"   if exists('term_buf')
"     echo "Terminal window found with buffer number: " . term_buf
"     " Here you can add code to use this terminal window for showing output
"   else
"     echo "No terminal window found."
"   endif
" endfunction

" Call the function to check for a terminal window
" command! FindTerminal call FindTerminalWindowBuffer()



function! ListTerminalBuffers()
    echo "Terminal Buffers:"
    for bufnr in range(1, bufnr('$'))
        if getbufvar(bufnr, '&buftype') ==# 'terminal'
            echo 'Buffer' bufnr ': ' . bufname(bufnr)
        endif
    endfor
endfunction

command! ListTerm call ListTerminalBuffers()



function! FindOpenTerminalWindow()
    " Iterate through each tab page
    for tabnr in range(1, tabpagenr('$'))
        " Iterate through each window in the tab page
        for winnr in range(1, tabpagewinnr(tabnr, '$'))
            " Get the buffer number for the window
            let bufnr = winbufnr(winnr)
            " Check if the buffer is a terminal
            if getbufvar(bufnr, '&buftype') ==# 'terminal' || getbufvar(bufnr, '&buftype') ==# 'term'
                " Return the window ID if a terminal is found
                return win_getid(winnr, tabnr)
            endif
        endfor
    endfor
    " Return 0 if no terminal window is found
    return "No terminal window found"
endfunction
command! FindOpenTerminal call FindOpenTerminalWindow()

function! UseTerminalToShowOutput(command)
    " Find an open terminal window
    let term_win_id = FindOpenTerminalWindow()
    if term_win_id != 0
        " A terminal window is found, switch to it
        call win_gotoid(term_win_id)
        " Send the command to the terminal
        call term_sendkeys(bufnr('%'), a:command . "\r")
    else
        " No terminal window found, optionally open a new terminal window
        " and execute the command
        new | terminal
        call term_sendkeys(bufnr('%'), a:command . "\r")
    endif
endfunction
command! UseTerminal call UseTerminalToShowOutput('ls')












