" let g:terminal_bufnr = -1
" function! GetShell(command)
"     let escaped_command =  shellescape(a:command,   2)
"     if has('unix')
"         let shell = substitute(system('basename $SHELL'), '\n', '', '')

"         if shell ==# "bash"
"             " Check if a terminal window is already open
"             if g:terminal_bufnr != -1 && buflisted(g:terminal_bufnr)
"                 " Switch to the terminal window
"                 execute 'buffer' g:terminal_bufnr
"                 " Clear the buffer and execute the command
"                 if has('nvim')
"                     call term_sendkeys(g:terminal_bufnr, "\<C-l>")
"                     call term_sendkeys(g:terminal_bufnr, 'bash -c ' . escaped_command . ';exec bash' . "\<CR>")
"                 else
"                     " For Vim, use a different approach to clear the terminal
"                     execute 'normal! gg"_dG'
"                     call feedkeys(':term bash -c ' . escaped_command . ';exec bash' . "\<CR>", 'n')
"                 endif
"             else
"                 " Open a new terminal window and store its buffer number
"                 execute "vsplit | term bash -c " . escaped_command . ";exec bash"
"                 let g:terminal_bufnr = bufnr('%')
"             endif
"         endif
"     else
"         let g:os = "Not supported shell"
"         echo g:os
"     endif
" endfunction

" function! GetShell(command)
"     let escaped_command =  shellescape(a:command,   2)
"     if has('unix')
"         let shell = substitute(system('basename $SHELL'), '\n', '', '')

"         if shell ==# "bash"
"             " Check if a terminal window is already open
"             if g:terminal_bufnr != -1 && buflisted(g:terminal_bufnr)
"                 " Switch to the terminal window
"                 execute 'buffer' g:terminal_bufnr
"                 " Clear the buffer and execute the command
"                 call nvim_buf_set_lines(g:terminal_bufnr,  0, -1,  0, ['bash -c ' . escaped_command . ';exec bash'])
"             else
"                 " Open a new terminal window and store its buffer number
"                 execute "vsplit | term bash -c " . escaped_command . ";exec bash"
"                 let g:terminal_bufnr = bufnr('%')
"             endif
"         endif
"     else
"         let g:os = "Not supported shell"
"         echo g:os
"     endif
" endfunction



" chan_id function
" function! GetShell(command)
"     let escaped_command =  shellescape(a:command,   2)
"     if has('unix')
"         let shell = substitute(system('basename $SHELL'), '\n', '', '')

"         if shell ==# "bash"
"             " Check if a terminal window is already open
"             if g:terminal_bufnr != -1 && buflisted(g:terminal_bufnr)
"                 " Switch to the terminal window
"                 execute 'buffer' g:terminal_bufnr
"                 " Get the channel ID for the terminal buffer
"                 let chan_id = nvim_get_chan_info(g:terminal_bufnr)['id']
"                 " Send the command to the terminal
"                 call nvim_chan_send(chan_id, 'bash -c ' . escaped_command . ';exec bash' . "\<CR>")
"             else
"                 " Open a new terminal window and store its buffer number
"                 execute "vsplit | term bash -c " . escaped_command . ";exec bash"
"                 let g:terminal_bufnr = bufnr('%')
"             endif
"         endif
"     else
"         let g:os = "Not supported shell"
"         echo g:os
"     endif
" endfunction




" " pass run command
" function! CodeRun()
"     let l:ext = expand("%:e") 
"     let l:fullpath = expand("%:p") 

"     if l:ext == "py"
"         call GetShell("python -u " . shellescape(l:fullpath)) 
"     else
"         call GetShell("echo 'Not supported filetype'")
"     endif
" endfunction

" command! RunCode call CodeRun()










" function! CorrrectRunCode(command)
"     let escaped_command = shellescape(a:command, 2)

"     if has('win32') || has('win64')
"         $win_shell = Split-Path -Leaf (Get-Command $PROFILE).Source
"         if win_shell ==# "powershell"
"             execute "term powershell -c " . escaped_command . ";exec powershell" 
"         elseif win_shell ==# "pwsh"
"             execute "term pwsh -c " . escaped_command . ";exec pwsh" 
"         endif
"     elseif has('unix')
"         let shell = substitute(system('basename $SHELL'), '\n', '', '')
"         if shell ==# "bash"
"             execute "vsplit | term bash -c " . escaped_command . ";exec bash" 
"         elseif shell ==# "zsh"
"             execute "term zsh -c " . escaped_command . ";exec zsh" 
"         elseif shell ==# "ksh"
"             execute "term ksh -c " . escaped_command . ";exec ksh" 
"         elseif shell ==# "fish" 
"             execute "term fish -c " . escaped_command . ";exec fish"
"         endif
"     else
"       let g:os = "Not recongnized OS"
"       echo g:os
"     endif
" endfunction

" function! CodeRunner()
"     let l:ext = expand("%:e") " Get current file extension
"     let l:fullpath = expand("%:p") " Get current file path

"     if l:ext == "py"
"         call CorrrectRunCode("python -u " . shellescape(l:fullpath)) 
"     elseif l:ext == "js"
"         call CorrrectRunCode("node " . shellescape(l:fullpath)) 
"     elseif l:ext == "ts"
"         call CorrrectRunCode("ts-node " . shellescape(l:fullpath))
"     elseif l:ext == "tsx"
"         call CorrrectRunCode("ts-node " . shellescape(l:fullpath))
"     elseif l:ext == "c"
"         call CorrrectRunCode("gcc " . shellescape(l:fullpath) . " -o " . shellescape(l:fullpath:r) . " && " . shellescape(l:fullpath:r))
"     elseif l:ext == "cpp"
"         call CorrrectRunCode("g++ " . shellescape(l:fullpath) . " -o " . shellescape(l:fullpath:r) . " && " . shellescape(l:fullpath:r))
"     elseif l:ext == "java"
"         call CorrrectRunCode("javac " . shellescape(l:fullpath) . " && java " . shellescape(l:fullpath:r))
"     elseif l:ext == "go"
"         call CorrrectRunCode("go run " . shellescape(l:fullpath))
"     elseif l:ext == "rs"
"         call CorrrectRunCode("rustc " . shellescape(l:fullpath) . " && " . shellescape(l:fullpath:r))
"     elseif l:ext == "php"
"         call CorrrectRunCode("php " . shellescape(l:fullpath))
"     elseif l:ext == "lua"
"         call CorrrectRunCode("lua " . shellescape(l:fullpath))
"     elseif l:ext == "sh"
"         call CorrrectRunCode("bash " . shellescape(l:fullpath))
"     elseif l:ext == "ps2"
"         call CorrrectRunCode("pwsh " . shellescape(l:fullpath))
"     elseif l:ext == "md"
"         call CorrrectRunCode("pandoc -s " . shellescape(l:fullpath) . " -o " . shellescape(l:fullpath:r) . ".html")
"     elseif l:ext == "html"
"         call CorrrectRunCode("firefox " . shellescape(l:fullpath))
"   endif
" endfunction

" command! RunCode call CodeRunner()

" function! CodeRunner()
"   let l:ext = expand("%:e")
"   let l:fullpath = expand("%:p")
"   if l:ext == "py"
"       execute "T python -u " . shellescape(l:fullpath)
"   elseif l:ext == "js"
"       execute "vsplit \| terminal"
"       execute "send-keys node " . shellescape(l:fullpath)
"   endif
" endfunction

" command! RunCode call CodeRunner()

" function! RunCommand(command)
"   " Escape special characters in the command
"     let escaped_command = shellescape(a:command, 2)
"   " Open a new terminal window with the provided command and keep the shell running
"     execute "vsplit | term bash -c " . escaped_command . ";exec bash"
"     " execute "term bash -c " . escaped_command . ";exec bash"
" endfunction


" function! CodeRunner()
"   let l:ext = expand("%:e")
"   let l:fullpath = expand("%:p")

"   if l:ext == "py"
"       " execute 'vsplit \| RunBashCommand("python -u  . shellescape(l:fullpath)")'
"       call RunBashCommand("python -u " .shellescape(l:fullpath)) 
"   elseif l:ext == "js"
"       execute "vsplit \| terminal"
"       execute "send-keys node " . shellescape(l:fullpath)
"   endif
" endfunction

" command! RunCode call CodeRunner()


" function! CodeRunner()
"     let l:ext = expand("%:e")
"     let l:fullpath = expand("%:p")

"     if l:ext == "py"
"         call RunCommand("python -u " . shellescape(l:fullpath)) 
"     elseif l:ext == "js"
"         call RunCommand("node " . shellescape(l:fullpath)) 
"   endif
" endfunction

" command! RunCode call CodeRunner()







" let g:neoterm_callbacks = {}
"     function! g:neoterm_callbacks.before_new()
"       if winwidth('.') > 101
"         let g:neoterm_default_mod = 'botright vertical'
"       else
"         let g:neoterm_default_mod = 'botright'
"       end
"     endfunction



" function! RunCode()
"  let ext = &filetype
"  let fullpath = expand('%:p')
"  let cmd = ''
"  if ext == 'python'
"    let cmd = 'python -u ' . shellescape(fullpath)
"  elseif ext == 'javascript'
"    let cmd = 'node ' . shellescape(fullpath)
"  endif
"  if cmd != ''
"    execute 'terminal ' . cmd
"  endif
" endfunction
" command! RunCode call RunCode()


" MarkdownPreview
" function! s:MarkdownPreview()
"    let l:current_file = expand('%:p')
"    let l:output_file = tempname() . '.html'
"    let l:command = 'pandoc -s ' . l:current_file . ' -o ' . l:output_file
"    call system(l:command)
"    execute 'edit ' . l:output_file
" endfunction

" command! MarkdownPreview :call s:MarkdownPreview()




" Corrrect
" function! RunCommand(command)
"     let escaped_command = shellescape(a:command, 2) " Escape non-alpha numeric characters
"     " let shell = substitute($SHELL, '.*\\\(\w*\)$', '\2', '')
"     " let shell = substitute($SHELL, '.*/\(\w*\)', '\2', '')
"     let shell = substitute(system('basename $SHELL'), '\n', '', '')
"     " Open integrated shell, In my case I'm using Bash shell 
"    if shell ==# "bash"
"        execute "vsplit | term bash -c " . escaped_command . ";exec bash" 
"    elseif shell ==# "zsh"
"        execute "term zsh -c " . escaped_command . ";exec zsh" 
"    elseif shell ==# "pwsh"
"        execute "term pwsh -c " . escaped_command . ";exec pwsh" 
"    elseif shell ==# "powershell"
"        execute "term powershell -c " . escaped_command . ";exec powershell" 
"    elseif shell ==# "cmd"
"        execute "term cmd -c " . escaped_command . ";exec cmd" 
"    elseif shell ==# "ksh"
"        execute "term ksh -c " . escaped_command . ";exec ksh" 
"    elseif shell ==# "fish" 
"        execute "term fish -c " . escaped_command . ";exec fish"
"    else
"        echo "Unsupported shell: " . shell
"    endif
" endfunction


" function! RunCommand(command)
"     let escaped_command = shellescape(a:command, 2)

"     " Use `basename` to extract the shell name
"     let shell_name = substitute(system('basename $SHELL'), '\n', '', '')

"     " Open integrated shell based on the extracted shell name
"     if shell_name ==# "bash" 
"         execute "term bash -c " . escaped_command . ";exec bash" 
"     elseif shell_name ==# "zsh"
"         execute "term zsh -c " . escaped_command . ";exec zsh" 
"     elseif shell_name ==# "pwsh" || shell_name ==# "powershell"
"         execute "term pwsh -c " . escaped_command . ";exec pwsh" 
"     elseif shell_name ==# "cmd"
"         execute "term cmd -c " . escaped_command . ";exec cmd" 
"     else
"         echo "Unsupported shell: " . shell_name
"     endif
" endfunction


" $shell_name = Split-Path -Leaf (Get-Command $PROFILE).Source
" Write-Output $shell_name

" function! WhichOS()
"     if has('win33') || has('win64')
"         " Windows-specific configuration
"         let g:windows = 'Windows'
"         echo g:windows
"     else
"         " Unix/Linux-specific configuration
"         let g:unix = 'Unix'
"         echo g:unix
"     endif
" endfunction
" command! WhichOS call WhichOS()






" new fresh

let s:terminal_bufnr = -1

" Check os and shell
function! GetShell(command)
    let escaped_command = shellescape(a:command, 2)
    if has('unix')
        let shell = substitute(system('basename $SHELL'), '\n', '', '')

        if shell ==# "bash"
            if s:terminal_bufnr == -1
                " Create a new vertical split terminal window
                execute "vsplit | term bash -c " . escaped_command . ";exec bash"
                let s:terminal_bufnr = bufnr('%')
            else
                " Reuse the existing terminal window if it's still valid
                let term_win_id = bufwinnr(s:terminal_bufnr)
                if term_win_id != -1
                    " Window is open, switch to it
                    execute term_win_id . "wincmd w"
                else
                    " Window is closed, create a new one
                    execute "vsplit | term bash -c " . escaped_command . ";exec bash"
                    let s:terminal_bufnr = bufnr('%')
                endif
            endif
        endif
    else
        let g:os = "Not supported shell"
        echo g:os
    endif
endfunction

" Handle terminal window closure
augroup TerminalWindow
    autocmd!
    autocmd TermClose * let s:terminal_bufnr = -1
augroup END

" Pass run command
function! CodeRun()
    let l:ext = expand("%:e") 
    let l:fullpath = expand("%:p") 

    if l:ext == "py"
        call GetShell("python -u " . shellescape(l:fullpath)) 
    elseif l:ext == "js"
        call GetShell("node " . shellescape(l:fullpath))
    elseif l:ext == "ts"
        call GetShell("ts-node " . shellescape(l:fullpath))
    elseif l:ext == "tsx"
        call GetShell("ts-node " . shellescape(l:fullpath))
    elseif l:ext == "c"
        " call GetShell("gcc " . shellescape(l:fullpath) . " -o " . shellescape(l:fullpath:r) . " && " . shellescape(l:fullpath:r))
        " let compiled_command = "gcc " . shellescape(l:fullpath) . " -o " . shellescape(l:fullpath:r) 
        " call GetShell(compile_command . " && " . shellescape(l:fullpath:r))

    elseif l:ext == "cpp"
        call GetShell("g++ " . shellescape(l:fullpath) . " -o " . shellescape(l:fullpath:r) . " && " . shellescape(l:fullpath:r)) 
    elseif l:ext == "java"
        call GetShell("javac " . shellescape(l:fullpath) . " && java " . shellescape(l:fullpath:r))
    elseif l:ext == "go"
        call GetShell("go run " . shellescape(l:fullpath))
    elseif l:ext == "rs"
        call GetShell("rustc " . shellescape(l:fullpath) . " && " . shellescape(l:fullpath:r))
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

command! RunCode call CodeRun()
