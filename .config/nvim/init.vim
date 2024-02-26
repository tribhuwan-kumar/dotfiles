" <------------------------@tribhuwan-kumar------------------------>
" <-------------------------Neovim Settings------------------------->
:syntax on
:set nowrap
:set number
:set autoread
:set smarttab
:set hlsearch
:set splitright
:set autoindent
:set termguicolors
:set relativenumber
:set mouse=a
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set encoding=UTF-8
:set completeopt-=preview 
:set clipboard=unnamedplus " system clipboard
" :set clipboard+=unnamedplus

" <-------------------------Plugins------------------------->
call plug#begin()

Plug 'tpope/vim-obsession' " Session Management
Plug 'github/copilot.vim' " Copilot
Plug 'tpope/vim-surround' " Surrounding ysw
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'mg979/vim-visual-multi' " CTRL + N for multiple cursors
Plug 'rstacruz/vim-closer' " For brackets autocompletion
Plug 'akinsho/toggleterm.nvim' " For Terminal
Plug 'jiangmiao/auto-pairs' " For auto closing ( [ {
Plug 'sheerun/vim-polyglot'  " Plugin for syntax highlighting and language features
Plug 'lewis6991/gitsigns.nvim' " For git tracking
Plug 'rest-nvim/rest.nvim' " HTTP Client
Plug 'nvim-lua/plenary.nvim' " For rest.nvim  
Plug 'aurum77/live-server.nvim' " Live Server
Plug 'gregsexton/MatchTag' " For matching html tags
" Plug 'tpope/vim-eunuch.git' " For file operations
" Plug 'Rigellute/shades-of-purple.vim' " Purple theme
" Plug 'Pocco81/AutoSave.nvim' " Auto Save
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }  "For Highlighting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder

" Plug 'tribhuwan-kumar/Code-runner-plugin-for-Nvim' " Code Runner
Plug 'tribhuwan-kumar/custom-tokyonight.nvim' " Custom Tokyonight theme 
Plug 'tribhuwan-kumar/custom-vim-airline' " Custom Airline theme

" Neotree
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

" These plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Auto-completion For different file types 
" Plug 'hrsh7th/nvim-cmp'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

" snippets
Plug 'honza/vim-snippets' 
" Plug 'L3MON4D3/LuaSnip' 
" Plug 'rafamadriz/friendly-snippets' 

" Wilder for Nvim command mode 
Plug 'gelguy/wilder.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'romgrk/fzy-lua-native', { 'do': 'make' }

" Bufferline
" Plug 'akinsho/bufferline.nvim', { 'tag': '*' }

" Indent line
Plug 'lukas-reineke/indent-blankline.nvim'

" Markdown preview
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" <-------------------------Language specific DAP-------------------------->
Plug 'mfussenegger/nvim-dap-python' " For python



Plug 'ryanoasis/vim-devicons' " Developer Icons
call plug#end()


" <-------------------------Paths & Variables-------------------------->
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

" Paths
let g:tagbar_ctags_bin =  '/usr/bin/ctags' " Tagbar exburenant ctags path
let g:python3_host_prog = "/usr/bin/python3" " Python bin path


" <--------------------------Colorscheme---------------------------->
" Shades of purple 
" :colorscheme shades_of_purple 

" Tokyonight
:colorscheme tokyonight-moon


" <-------------------------Keybindings------------------------->
" Copilot Keybindings
" let g:copilot_no_tab_map = v:true
" imap <silent><script><expr> <Leader><Tab> copilot#Accept("\<CR>")
" imap <C-L> <Plug>(copilot-accept-word)

" Accept auto complete by 'Tab' key
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<TAB>"

" Keybindings
" let mapleader = "z" " My binding
let mapleader = "\<Space>" " For better convinience

" Neotree, FZF, CodeRunner, CoC-git, Commentary keybindings 
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>k :q<CR>
nnoremap <Leader>l :call CocActionAsync('jumpDefinition')<CR>
nnoremap <Leader>p :vsplit \| terminal<CR>
nnoremap <Leader>b :botright split \| terminal<CR>
nnoremap <Leader>r :CheckCode<CR>
nnoremap <Leader>i :Gitsigns preview_hunk_inline<CR>
nnoremap <Leader>o :Gitsigns preview_hunk<CR>
nnoremap <Leader>u :Gitsigns reset_hunk<CR>
nnoremap <Leader>a :Neotree focus<CR>
nnoremap <Leader>q :Neotree toggle<CR>
nnoremap <C-q> :Neotree toggle<CR>
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

nmap <F1> :TagbarToggle<CR>


" For selecting strings by 'h,j,k,l' keys 
nnoremap <S-h> vh
nnoremap <S-j> vj
nnoremap <S-k> vk
nnoremap <S-l> vl


" Save, Cut, Undo, Redo, Selection & Yank keybindings
vmap <C-h> b
vmap <C-l> e
nmap ,p o<Esc>p
" noremap  <C-v> "+p
nnoremap <C-s> :w<CR>
nnoremap <C-c> yy
nnoremap <C-a> ggVG
nnoremap <C-z> u
nnoremap <C-S-z> r
nnoremap <C-x> dd
vnoremap <C-z> u
vnoremap <C-x> x
vnoremap <C-c> "+y
vnoremap <BS> d

" Exit by 'Esc' in terminal mode
tnoremap <Esc> <C-\><C-n>


" Alt + arrow Up/Down or 'j,k' to move line up and down
inoremap <M-Up> <Esc>:m-2<CR>==gi
inoremap <M-Down> <Esc>:m+<CR>==gi
nnoremap <M-Up> :m-2<CR>==
nnoremap <M-Down> :m+<CR>==
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv


" Tab management
nnoremap <C-o> :tabn<CR>
nnoremap <C-i> :tabp<CR>


" Cursor navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
:noremap j gj
:noremap k gk


" Insert mode keybindings
:imap <C-J> <C-n> 
:imap <C-K> <C-p>
" inoremap <C-J> <Nop>
inoremap <C-O> <C-o>o


" <------------------------------Airline----------------------------->
" Air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='shades_of_purple' 

" let g:Powerline_symbols = 'fancy'

" set t_Co=256
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'

" Airline with COC
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = 'E:'
let g:airline#extensions#coc#warning_symbol = 'W:'
let g:airline#extensions#coc#show_coc_status = 1
let g:airline#extensions#coc#stl_format_err = '%C(L%L)'
let g:airline#extensions#coc#stl_format_warn = '%C(L%L)'


" <------------------------------Autorefresh---------------------------->
autocmd BufWritePost * Gitsigns refresh
autocmd DirChanged * Gitsigns refresh
autocmd BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro


" <-----------------------------Autosave------------------------------------>
let g:auto_save = 1
let g:auto_save_events = ['InsertLeave', 'TextChanged']


" <------------------------------Clipboard----------------------------->
" wl-clipboard 'sudo pacman -S wl-clipboard'
   let g:clipboard = {
     \   'copy': {
     \       '+': ['wl-copy', '--trim-newline'],
     \       '*': ['wl-copy', '--trim-newline'],
     \   },
     \   'paste': {
     \       '+': ['wl-paste', '--no-newline'],
     \       '*': ['wl-paste', '--no-newline'],
     \   },
     \ }


" <-----------------------------Gitsigns------------------------------------>
lua require('Gitsigns-Config')
set statusline+=%{get(b:,'gitsigns_status','')}


" <-----------------------------Wilder------------------------------------>
" ++once supported in Nvim 0.4+ and Vim 8.1+
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


" <-----------------------------Copilot------------------------------------>
" Copilot keybindings
let g:copilot_no_tab_map = v:true
imap <C-L> <Plug>(copilot-accept-word)
imap <silent><script><expr> <Leader><Tab> copilot#Accept("\<CR>")


" <-----------------------------DAP------------------------------------>
" config
lua require("dapui").setup()
lua require('debugger')
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
lua require('dap').set_log_level('DEBUG')


" Debugger keybindings
nnoremap <Leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <Leader>dc :lua require'dap'.continue()<CR>
nnoremap <Leader>ds :lua require'dap'.step_into()<CR>
nnoremap <Leader>do :lua require'dap'.step_over()<CR>
nnoremap <Leader>dr :lua require'dap'.repl.open()<CR>


" <-----------------------------Coc------------------------------------>
" inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
" :imap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" :imap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"



" <-----------------------------Bufferline------------------------------------>
" lua require("bufferline").setup{}


" <-----------------------------Indentline------------------------------------>
lua require("ibl").setup()


" <-----------------------------Neotree------------------------------------>
lua require("Neotree-config")


" <-----------------------------Markdown------------------------------------>
let g:instant_markdown_theme = 'dark'


" <----------------------------Just some notes ---------------------------->
" :PlugClean :PlugInstall :UpdateRemotePlugins
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE


source $HOME/.config/nvim/run_code.vim




" <-------------------------------Garbage-------------------------------->
" imap <C-Enter> <Esc>o
" imap <C-Enter> <Esc>o<Esc>i
" inoremap <C-Enter> <Esc>o<CR>==gi

