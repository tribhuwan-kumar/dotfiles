set wildignore+=*/.git/**,*/.venv/**,*/dev/**,*/target/**,*/deps/**,*/_build/**,*/node_modules/**,*/__pycache__/**,*.json,*.lock,*.jpg,*.png,*.ico,*.jpeg,*.svg,*.ttf

function SearchWordInFile()
    let l:word = expand("<cword>")
    let l:filename = expand("%")
    let l:vimgrepcmd = printf(":vimgrep /%s/ %s", l:word, l:filename)
    execute l:vimgrepcmd
endfunction

function SearchWordInSameExt()
    let l:word = expand("<cword>")
    let l:extension = expand("%:e")
    let l:vimgrepcmd = printf(":vimgrep /%s/ **/*.%s", l:word, l:extension)
    execute l:vimgrepcmd
endfunction

function ReplaceWordInFile()
    let l:word = expand("<cword>")
    let l:filename = expand("%")
    let l:extension = expand("%:e")
    let l:replacementWord = input("Enter the replacement word: ")
    if l:replacementWord!= ''
        let l:vimgrepcmd = printf(":vimgrep /%s/ %s | cdo s/%s/%s/g | w", l:word, l:filename, l:word, l:replacementWord)
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
    if l:replacementWord!= ''
        let l:vimgrepcmd = printf(":vimgrep /%s/ **/*.%s | cdo s/%s/%s/g | w", l:word, l:extension, l:word, l:replacementWord)
        silent execute l:vimgrepcmd
        echo "Replaced '". l:word. "' with '". l:replacementWord "'" . "in whole project"
    else
        echo "No replacement word provided"
    endif
endfunction


nnoremap sw :call SearchWordInFile()<CR>
nnoremap sp :call SearchWordInSameExt()<CR>
nnoremap fw :call ReplaceWordInFile()<CR>
nnoremap fp :call ReplaceWordInSameExt()<CR>
nnoremap co :copen<CR>
nnoremap cn :cnext<CR>
nnoremap cm :cprevious<CR>
nnoremap cq :cclose<CR>

