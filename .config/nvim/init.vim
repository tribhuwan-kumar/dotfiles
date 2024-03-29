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
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " Autocompletion

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
" paths
let g:tagbar_ctags_bin =  '/usr/bin/ctags' " Tagbar exburenant ctags path
let g:python3_host_prog = "/usr/bin/python3" " Python bin path


" <--------------------------Colorscheme---------------------------->
" Shades of purple 
" :colorscheme shades_of_purple 

" Tokyonight
:colorscheme tokyonight-moon


" <-------------------------Keybindings------------------------->
" let mapleader = "z" " My binding
let mapleader = "\<Space>" " for better convinience

" Help doc
nnoremap <Leader>h K<CR>

" exit by 'Esc' in terminal mode
tnoremap <Esc> <C-\><C-n>

" insert mode keybindings
inoremap <C-O> <C-o>o

" commentary
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

" Tab management
nnoremap <C-o> :tabn<CR>
nnoremap <C-i> :tabp<CR>

" FZF, Tagbar keybindings 
nmap <F1> :TagbarToggle<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>k :q<CR>
nnoremap <Leader>p :vsplit \| terminal<CR>
nnoremap <Leader>b :botright split \| terminal<CR>
nnoremap <Leader>r :CheckCode<CR>

" cursor navigation
:noremap j gj
:noremap k gk
" navigation in windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Prevent registering to clipboard
nnoremap x "_x
nnoremap X "_x
vnoremap x "_x
vnoremap X "_x

" For selecting strings by 'h,j,k,l' keys 
nnoremap <S-h> vh
nnoremap <S-j> vj
nnoremap <S-k> vk
nnoremap <S-l> vl

" save, cut, undo, redo, selection & yank keybindings
vmap <C-h> b
vmap <C-l> e
nmap ,p o<Esc>p
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

" Alt + arrow Up/Down or 'j,k' to move line up and down
inoremap <M-Up> <Esc>:m-2<CR>==gi
inoremap <M-Down> <Esc>:m+<CR>==gi
nnoremap <M-Up> :m-2<CR>==
nnoremap <M-Down> :m+<CR>==
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv


" <------------------------------Autorefresh---------------------------->
autocmd BufWritePost * Gitsigns refresh
autocmd DirChanged * Gitsigns refresh
autocmd BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro


" <-----------------------------Autosave------------------------------------>
let g:auto_save = 1
let g:auto_save_events = ['InsertLeave', 'TextChanged']


" <-----------------------------Gitsigns------------------------------------>
lua require('Gitsigns-Config')
set statusline+=%{get(b:,'gitsigns_status','')}

" keybindings
nnoremap <Leader>i :Gitsigns preview_hunk_inline<CR>
nnoremap <Leader>o :Gitsigns preview_hunk<CR>
nnoremap <Leader>u :Gitsigns reset_hunk<CR>
nnoremap <Leader>n :Gitsigns next_hunk<CR>
nnoremap <Leader>m :Gitsigns prev_hunk<CR>


" <-----------------------------Copilot------------------------------------>
" global variable
let g:copilot_no_tab_map = v:true

" copilot keybindings
imap <C-L> <Plug>(copilot-accept-word)
imap <silent><script><expr> <Leader><Tab> copilot#Accept("\<CR>")


" <-----------------------------DAP------------------------------------>
" config
lua require("dapui").setup()
lua require('debugger')
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
lua require('dap').set_log_level('DEBUG')

" debugger keybindings
nnoremap <Leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <Leader>dc :lua require'dap'.continue()<CR>
nnoremap <Leader>ds :lua require'dap'.step_into()<CR>
nnoremap <Leader>do :lua require'dap'.step_over()<CR>
nnoremap <Leader>dr :lua require'dap'.repl.open()<CR>


" <-----------------------------Coc------------------------------------>
" Global variables
" let g:coc_snippet_next = '<C-j>'
" let g:coc_snippet_prev = '<C-k>'
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python', 'coc-clangd', 'coc-copilot', 'coc-vimlsp']  " list of CoC extensions needed

" accept auto complete by 'Tab' key & move up and down by 'C-j' and 'C-k' keys, 'C-l' for jump to definition 
:imap <C-J> <C-n> 
:imap <C-K> <C-p>
nnoremap <Leader>l :call CocActionAsync('jumpDefinition')<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<TAB>"


" <-----------------------------Bufferline------------------------------------>
" lua require("bufferline").setup{}


" <-----------------------------Indentline------------------------------------>
lua require("ibl").setup()


" <-----------------------------Neotree------------------------------------>
" config
lua require("Neotree-config")

" keybindings
nnoremap <Leader>a :Neotree focus<CR>
nnoremap <Leader>q :Neotree toggle<CR>
nnoremap <C-q> :Neotree toggle<CR>


" <-----------------------------Markdown------------------------------------>
let g:instant_markdown_theme = 'dark'


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


" <------------------------------Airline----------------------------->
" Air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='shades_of_purple' 

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

" Airline with COC
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = 'E:'
let g:airline#extensions#coc#warning_symbol = 'W:'
let g:airline#extensions#coc#show_coc_status = 1
let g:airline#extensions#coc#stl_format_err = '%C(L%L)'
let g:airline#extensions#coc#stl_format_warn = '%C(L%L)'


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



" <-----------------------------Sources------------------------------------>
source $HOME/.config/nvim/run_code.vim


" <-------------------------------Garbage-------------------------------->
" imap <C-Enter> <Esc>o
" imap <C-Enter> <Esc>o<Esc>i
" inoremap <C-Enter> <Esc>o<CR>==gi
" inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
" :imap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
" :imap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
