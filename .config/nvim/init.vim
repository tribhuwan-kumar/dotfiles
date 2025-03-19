" <-------------------------Neovim Settings------------------------->
syntax on
set nowrap
set number
set hlsearch
set smarttab
set autoread
set smartcase
set expandtab
set splitright
set ignorecase
set autoindent
set termguicolors
set relativenumber
set viewoptions-=curdir

set mouse=a
set tabstop=2
set shiftwidth=2
set textwidth=160
set ttimeoutlen=0
set softtabstop=2
set updatetime=250
set timeoutlen=1000
set encoding=UTF-8
set signcolumn=yes:2
set foldmethod=manual
set completeopt-=preview
set clipboard=unnamedplus
set grepprg=rg\ --vimgrep
set grepformat=%f:%l:%c:%m,%f


" <--------------------------------------------------------Plugins using VIM-PLUG----------------------------------------------------------------------->
call plug#begin()

Plug 'tpope/vim-dadbod'                                                                       " Databases support
Plug 'tpope/vim-repeat'                                                                       " Repeat support
Plug 'preservim/tagbar'                                                                       " Tagbar & code navigation
Plug 'L3MON4D3/LuaSnip'                                                                       " Snippets engine
Plug 'junegunn/fzf.vim'                                                                       " fzf vim
Plug 'hrsh7th/nvim-cmp'                                                                       " Completion
Plug 'hrsh7th/cmp-path'                                                                       " Path completion
Plug 'prisma/vim-prisma'                                                                      " Prisma
Plug 'github/copilot.vim'                                                                     " Copilot
Plug 'honza/vim-snippets'                                                                     " Snippets
Plug 'tpope/vim-surround'                                                                     " Surrounding ysw
Plug 'tpope/vim-fugitive'                                                                     " Git
Plug 'hrsh7th/cmp-buffer'                                                                     " Buffer completion
Plug 'tpope/vim-obsession'                                                                    " Session management
Plug 'gregsexton/MatchTag'                                                                    " Highlights matching html tags
Plug 'onsails/lspkind.nvim'                                                                   " LSP icons
Plug 'rcarriga/nvim-dap-ui'                                                                   " DAP UI
Plug 'MunifTanjim/nui.nvim'                                                                   " UI component library
Plug 'hrsh7th/cmp-nvim-lsp'                                                                   " LSP completion
Plug 'lifepillar/pgsql.vim'                                                                   " PostgreSQL syntax highlighting
Plug 'oysandvik94/curl.nvim'                                                                  " Curl
Plug 'nvim-neotest/nvim-nio'                                                                  " Asynchronous IO
Plug 'nvim-lua/plenary.nvim'                                                                  " Pop-up api
Plug 'numToStr/Comment.nvim'                                                                  " Better Commenting
Plug 'neovim/nvim-lspconfig'                                                                  " Native LSP
Plug 'segeljakt/vim-silicon'                                                                  " Screenshot
Plug 'windwp/nvim-autopairs'                                                                  " Auto closing pairs
Plug 'mfussenegger/nvim-dap'                                                                  " Debugger
Plug 'pocco81/auto-save.nvim'                                                                 " Auto Save
Plug 'mg979/vim-visual-multi'                                                                 " Multiple cursors
Plug 'lewis6991/gitsigns.nvim'                                                                " Git Signs
Plug 'tribhuwan-kumar/harpoon'                                                                " File tracking
Plug 'zapling/mason-lock.nvim'                                                                " Mason lock
Plug 'williamboman/mason.nvim'                                                                " LSP installer
Plug 'aurum77/live-server.nvim'                                                               " Live Server
Plug 'Jezda1337/nvim-html-css'                                                                " HTML completion
Plug 'rasulomaroff/cmp-bufname'                                                               " Bufname completion
Plug 'AndrewRadev/tagalong.vim'                                                               " Auto rename tags
Plug 'saadparwaiz1/cmp_luasnip'                                                               " Snippets completion
Plug 'tribhuwan-kumar/CodeRunner'                                                             " Code Runner
Plug 'nvim-tree/nvim-web-devicons'                                                            " Web icons
Plug 'mfussenegger/nvim-dap-python'                                                           " Python debugger
Plug 'rafamadriz/friendly-snippets'                                                           " Snippets
Plug 'kristijanhusak/vim-dadbod-ui'                                                           " vim-dadbod UI
Plug 'lukas-reineke/lsp-format.nvim'                                                          " Formatter
Plug 'tribhuwan-kumar/neo-tree.nvim'                                                          " File System
Plug 'christoomey/vim-tmux-navigator'                                                         " Tmux navigator
Plug 'tribhuwan-kumar/NVIMColorPicker'                                                        " Color Picker
Plug 'williamboman/mason-lspconfig.nvim'                                                      " Mason LSP
Plug 'brenoprata10/nvim-highlight-colors'                                                     " Highlights colors
Plug 'tribhuwan-kumar/custom-vim-airline'                                                     " Status bar
Plug 'lukas-reineke/indent-blankline.nvim'                                                    " Indents line
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }                                                " Better theme
Plug 'romgrk/fzy-lua-native', { 'do': 'make' }                                                " Lua native fuzzy finder
Plug 'JoosepAlviste/nvim-ts-context-commentstring'                                            " Tsx, Jsx commenting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                                           " Fuzzy finder
Plug 'gelguy/wilder.nvim', { 'do': 'UpdateRemotePlugins' }                                    " Commands fuzzy finder
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                                   " Better syntax highlighting
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary', 'commit': '2ebe591' }            " Copilot chat
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}       " Markdown preview
Plug 'ryanoasis/vim-devicons'                                                                 " Developer icons ----> This should be at the end

call plug#end()


" <----------------------------Paths---------------------------------------->
let g:python3_host_prog = "/usr/bin/python3"                                                  " Python bin path

" <-------------------------Keybindings------------------------------------->
" let mapleader = "z"                                                                         " My binding
let mapleader = "\<Space>"                                                                    " For better convenience

" Help doc
nnoremap <Leader>h K<CR>

" Exit by 'Esc' in terminal mode
tnoremap <Esc><Esc> <C-\><C-n>

" Open recent file
:nnoremap <Leader>or :edit #<1<CR>

" Cursor navigation
:noremap j gj
:noremap k gk
nnoremap <C-d> <C-d>zz

" Tab management
nnoremap <C-o> :b#<CR>
nnoremap <C-i> :tabp<CR>

" Insert mode keybindings
inoremap <C-O> <C-o>o
inoremap <C-b> <C-o>diw

" Navigation in windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" FZF, Wrap, Tagbar, Visual Block, Code Runner keybinding
nnoremap <C-z> <C-q>
nnoremap <Leader><Esc> :noh<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>k :q<CR>
nnoremap <Leader>p :vsplit \| terminal<CR>
nnoremap <Leader>b :botright split \| terminal<CR>
nnoremap <Leader>B :HRunCode<CR>
nnoremap <Leader>R :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader><Tab> :set tabstop=4 shiftwidth=4 expandtab<CR>

" Prevent registering to clipboard
nnoremap S "_S
nnoremap c "_c
nnoremap d "_d
nnoremap D "_D
nnoremap C "_C
nnoremap X "+x
nnoremap xx dd
nnoremap dd "_dd
vnoremap p "_dP
vnoremap d "_d
vnoremap D "_D
vnoremap c "_c

" Selection
nnoremap <S-h> vh
nnoremap <S-j> vj
nnoremap <S-k> vk
nnoremap <S-l> vl

" Save, Selection
nnoremap <C-s> :w<CR>
nnoremap <C-g> ggVG
vnoremap <BS> "_d
nnoremap <Leader>v ^vg_
nnoremap ,p o<ESC>p==

" Short the SORROUNDINGS
"CUT with no REG
nnoremap c( "_ci(
nnoremap c) "_ci)
nnoremap c[ "_ci[
nnoremap c] "_ci]
nnoremap c{ "_ci{
nnoremap c} "_ci}
nnoremap c< "_ci<
nnoremap c> "_ci>
nnoremap c" "_ci"
nnoremap c' "_ci'
nnoremap c` "_ci`
nnoremap cw "_ciw
nnoremap cp "_cip
nnoremap ct "_cit

" Visually Select
nnoremap v( vi(
nnoremap v) vi)
nnoremap v[ vi[
nnoremap v] vi]
nnoremap v{ vi{
nnoremap v} vi}
nnoremap v< vi<
nnoremap v> vi>
nnoremap v" vi"
nnoremap v' vi'
nnoremap v` vi`
nnoremap vw viw
nnoremap vp vip
nnoremap vt vit

" Delete with no REG
nnoremap d( "_di(
nnoremap d) "_di)
nnoremap d[ "_di[
nnoremap d] "_di]
nnoremap d{ "_di{
nnoremap d} "_di}
nnoremap d< "_di<
nnoremap d> "_di>
nnoremap d" "_di"
nnoremap d' "_di'
nnoremap d` "_di`
nnoremap dw "_diw
nnoremap dp "_dip
nnoremap dt "_dit

" Yank
nnoremap y( yi(
nnoremap y) yi)
nnoremap y[ yi[
nnoremap y] yi]
nnoremap y{ yi{
nnoremap y} yi}
nnoremap y< yi<
nnoremap y> yi>
nnoremap y" yi"
nnoremap y' yi'
nnoremap y` yi`
nnoremap yw yiw
nnoremap yp yip
nnoremap yt yit

" CUT in REG
nnoremap q( di(
nnoremap q) di)
nnoremap q[ di[
nnoremap q] di]
nnoremap q{ di{
nnoremap q} di}
nnoremap q< di<
nnoremap q> di>
nnoremap q" di"
nnoremap q' di'
nnoremap q` di`
nnoremap qw diw
nnoremap qp dip
nnoremap qt dit

" Move lines by index +1,-1
inoremap <M-Up> <Esc>:m-2<CR>==gi
inoremap <M-Down> <Esc>:m+<CR>==gi
nnoremap <M-Up> :m-2<CR>==
nnoremap <M-Down> :m+<CR>==
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv

" Resize windows
nnoremap ) <CMD>vertical resize +5<CR>
nnoremap ( <CMD>vertical resize -5<CR>
nnoremap + <CMD>horizontal resize +2<CR>
nnoremap _ <CMD>horizontal resize -2<CR>


" <----------------------------Auto CMDs-------------------------------------->
autocmd BufRead,BufNewFile *.http set filetype=http
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
autocmd BufEnter,CursorHold,CursorHoldI *.* if mode() !=# 'c' | execute 'checktime' | endif


" <---------------------------LSP--------------------------------------------->
lua require("lsp-config")

                                                                                             " Keybindings
nnoremap <Leader>l <C-]>
nnoremap <C-]> :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>r :lua vim.lsp.buf.rename()<CR>

" empty
" nnoremap <Leader>c :lua vim.lsp.buf.rename()<CR>
" nnoremap <Leader>r :VRunCode<CR>
" nnoremap <Leader>t :tabnew \| term bash<CR>

" <---------------------------Mason------------------------------------------->
lua require("mason-config")


" <---------------------------Mason-Lock-------------------------------------->
lua require("mason-lock-config")


" <---------------------------Completion-------------------------------------->
lua require("completion-config")


" <---------------------------Snippets---------------------------------------->
lua require("luasnip-config")


" <---------------------------Indentline-------------------------------------->
lua require("indentline-config")


" <---------------------------Curl-------------------------------------------->
lua require("curl-config")


" <---------------------------Rocks------------------------------------------->
lua require("rocks-config")


" <--------------------------Tresssitter-------------------------------------->
lua require('tree-sitter-config')


" <-------------------------Colorscheme--------------------------------------->
lua require('theme-config')


" <------------------------Colorizer------------------------------------------>
lua require('highlights-colors-config')


" <--------------------------Tagbar------------------------------------------>
let g:tagbar_ctags_bin =  "/usr/bin/ctags"                                                    " Tagbar exburenant path
                                                                                              " Keybindings
nmap <F1> :TagbarToggle<CR>


" <----------------------------Autopairs------------------------------------->
lua require("nvim-autopairs").setup {}
lua require('autopairs-config')


" <----------------------------Comment--------------------------------------->
lua require('comment-config')
                                                                                               " Keybindings
vnoremap <Leader>/ :lua require('Comment.api').toggle.linewise()<CR>
nnoremap <Leader>/ :lua require('Comment.api').toggle.linewise()<CR>


" <---------------------------Neotree---------------------------------------->
lua require("neotree-config")
                                                                                                " Keybindings
nnoremap <C-q> :Neotree toggle<CR>
nnoremap <C-c> :Neotree reveal_file=%<CR>


" <-----------------------------Gitsigns------------------------------------>
lua require('gitsigns-config')
set statusline+=%{get(b:,'gitsigns_status','')}
autocmd BufWritePost,DirChanged * Gitsigns refresh
                                                                                                " Keybindings
nnoremap <Leader>i :Gitsigns preview_hunk_inline<CR>
nnoremap <Leader>o :Gitsigns preview_hunk<CR>
nnoremap <Leader>u :Gitsigns reset_hunk<CR>
nnoremap <Leader>n :Gitsigns next_hunk<CR>
nnoremap <Leader>m :Gitsigns prev_hunk<CR>
nnoremap gs :Gitsigns stage_hunk<CR>
nnoremap gr :Gitsigns undo_stage_hunk<CR>


" <------------------------------DAP--------------------------------------->
lua require("dapui").setup()
lua require('gdb-debugger')
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
lua require('dap').set_log_level('DEBUG')
                                                                                                " Keybindings
nnoremap <Leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <Leader>dc :lua require'dap'.continue()<CR>
nnoremap <Leader>ds :lua require'dap'.step_into()<CR>
nnoremap <Leader>do :lua require'dap'.step_over()<CR>
nnoremap <Leader>dr :lua require'dap'.repl.open()<CR>


" <----------------------------Harpoon--------------------------------------->
lua require("harpoon").setup()
                                                                                                " Keybindings
nnoremap <Leader>a  :lua require("harpoon.mark").add_file()<CR>
nnoremap <Leader>j :lua require("harpoon.ui").toggle_quick_menu()<CR>
                                                                                                " Jump to around files
nnoremap <Leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <Leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <Leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <Leader>4 :lua require("harpoon.ui").nav_file(4)<CR>
nnoremap <Leader>5 :lua require("harpoon.ui").nav_file(5)<CR>
nnoremap <Leader>6 :lua require("harpoon.ui").nav_file(6)<CR>
nnoremap <Leader>7 :lua require("harpoon.ui").nav_file(7)<CR>
nnoremap <Leader>8 :lua require("harpoon.ui").nav_file(8)<CR>
                                                                                                  " File navigation
nnoremap <Leader>w :lua require("harpoon.ui").nav_next()<CR>
nnoremap <Leader>e :lua require("harpoon.ui").nav_prev()<CR>


" <---------------------------Markdown--------------------------------------->
let g:instant_markdown_theme = 'dark'
let g:instant_markdown_autostart = 0
let g:instant_markdown_allow_unsafe_content = 1


" <-----------------------------Copilot & Copilot chat--------------------------------------->
lua require('copilot-chat')
let g:copilot_no_tab_map = v:true
autocmd BufRead * Copilot disable
                                                                                                   " Keybindings
imap <C-L> <Plug>(copilot-accept-word)
nnoremap <Leader>gg :CopilotChatToggle<CR>
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")


" <-----------------------------ColorPicker------------------------------------>
let g:NVIMColorPicker#InsertBefore#TheCursor = 1
                                                                                                   " Keybindings
nnoremap <Leader>s :ColorPicker<CR>
vnoremap <Leader>s :ColorPicker<CR>
inoremap <C-c> <C-o>:ColorPicker<CR>


" <-----------------------------Preview---------------------------------------->
function! OpenPreview()
	setlocal previewheight=1
	let l:line = line('.')
	execute 'pedit +' . l:line . ' %'
endfunction
                                                                                                   " Keybindings
nnoremap <silent> gp :call OpenPreview()<CR>
nnoremap gq :pclose<CR>

" <-----------------------------Folds------------------------------------------>
augroup RememberFolds
	autocmd!
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent! loadview
augroup END


" <-----------------------------Silicon----------------------------------------->
let g:silicon = {
      \   'theme':             'DarkNeon',
      \   'font':               'Fantasque Sans Mono',
      \   'background':         '#090909',
      \   'shadow-color':       '#000000',
      \   'line-pad':                   2,
      \   'pad-horiz':                 80,
      \   'pad-vert':                 100,
      \   'shadow-blur-radius':         0,
      \   'shadow-offset-x':            0,
      \   'shadow-offset-y':            0,
      \   'line-number':           v:true,
      \   'round-corner':          v:true,
      \   'window-controls':       v:true
      \ }
let g:silicon['output'] = '~/Pictures/Code-Screenshots/vim-screenshot-{time:%Y-%m-%d-%H%M%S}.png'


" <---------------------------Airline---------------------------------------->
let g:airline#extensions#default#section_truncate_width = {
      \ 'b': 80,
      \ 'x': 70,
      \ 'y': 80,
      \ 'z': 40,
      \ 'warning': 40,
      \ 'error': 40,
      \ }

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_theme='dark'                                                                      " Theme

let g:airline_section_z = '%2p%% %2l/%L:%1v'                                                    " Airline symbols
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''

let g:airline#extensions#whitespace#enabled = 0                                                 " Whitespace
let g:webdevicons_enable_airline_tabline = 1                                                    " Tabline
let g:webdevicons_enable_airline_statusline = 1                                                 " Statusline
let g:airline#extensions#tagbar#enabled = 0                                                     " Tagbar

let g:airline#extensions#nvimlsp#enabled = 1
let g:airline#extensions#nvimlsp#error_symbol = ' '
let g:airline#extensions#nvimlsp#warning_symbol = ' '
let g:airline#extensions#nvimlsp#show_line_numbers = 1
let g:airline#extensions#nvimlsp#open_lnum_symbol = '('
let g:airline#extensions#nvimlsp#close_lnum_symbol = ')'


" <-----------------------------GreppRg----------------------------------------->
function! ShowFirstResult()
  let l:qflist = getqflist()
  if !empty(l:qflist)
    let l:first_result = l:qflist[0]
    echo printf("(%d of %d): %s", 1, len(l:qflist), l:first_result.text)
  else
    echo "No matches found"
  endif
endfunction

command! -nargs=+ Srg execute 'silent! grep! ' . <q-args> | call ShowFirstResult()


" <-----------------------------Wilder----------------------------------------->
autocmd CmdlineEnter * ++once call s:wilder_init() | call wilder#main#start()

function! s:wilder_init() abort
  call wilder#setup({
    \ 'modes': [':', '/', '?'],
    \ 'next_key': '<Tab>',
    \ 'previous_key': '<S-Tab>',
    \ 'accept_key': '<Down>',
    \ 'reject_key': '<Up>',
    \ 'enable_cmdline_enter': 0,
    \ })

  let s:highlighters = [
    \ wilder#pcre2_highlighter(),
    \ wilder#basic_highlighter(),
    \ ]

  call wilder#set_option('pipeline', wilder#branch(
    \ wilder#cmdline_pipeline({
    \   'fuzzy': 1,
    \   'fuzzy_filter': wilder#lua_fzy_filter(),
    \ }),
    \ wilder#python_search_pipeline(),
    \ ))

  call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
    \ 'highlights': {
    \   'border': 'Normal',
    \ },
    \ 'border': 'rounded',
    \ 'highlighter': s:highlighters,
    \ 'left': [' ', wilder#popupmenu_devicons()],
    \ 'right': [' ', wilder#popupmenu_scrollbar()],
    \ })))
endfunction

" <----------------------------Sources----------------------------------------->
source ~/dotarch/.config/nvim/qucik-word.vim
