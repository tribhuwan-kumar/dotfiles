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
:set mouse=a
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set encoding=UTF-8
:set completeopt-=preview 
:set clipboard=unnamedplus " system clipboard
" :set clipboard+=unnamedplus
set statusline+=%{get(b:,'gitsigns_status','')} " Gitsigns status

" <-------------------------Plugins------------------------->
call plug#begin()

Plug 'github/copilot.vim' " Copilot
Plug 'tpope/vim-surround' " Surrounding ysw
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'mg979/vim-visual-multi' " CTRL + N for multiple cursors
Plug 'rstacruz/vim-closer' " For brackets autocompletion
Plug 'akinsho/toggleterm.nvim' " For Terminal
" Plug 'tpope/vim-eunuch.git' " For file operations
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }  "For Highlighting
Plug 'jiangmiao/auto-pairs' " For auto closing ( [ {
Plug 'sheerun/vim-polyglot'  " Plugin for syntax highlighting and language features
Plug 'lewis6991/gitsigns.nvim' " For git tracking
" Plug 'Rigellute/shades-of-purple.vim' " Purple theme
Plug 'rest-nvim/rest.nvim' " HTTP Client
Plug 'nvim-lua/plenary.nvim' " For rest.nvim  
Plug 'rafamadriz/friendly-snippets' " Snippets
Plug 'honza/vim-snippets' " Snippets
Plug 'L3MON4D3/LuaSnip' " Snippets
Plug 'hrsh7th/nvim-cmp' " Completion
Plug 'aurum77/live-server.nvim' " Live Server
Plug 'gregsexton/MatchTag' " For matching html tags
" Plug 'Pocco81/AutoSave.nvim' " Auto Save
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder

Plug 'tribhuwan-kumar/Code-runner-plugin-for-Nvim' " Code Runner
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
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting

" Wilder for Nvim command mode 
Plug 'gelguy/wilder.nvim', { 'do': 'UpdateRemotePlugins' }
Plug 'romgrk/fzy-lua-native', { 'do': 'make' }

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
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <Leader><Tab> copilot#Accept("\<CR>")
imap <C-L> <Plug>(copilot-accept-word)

" Accept auto complete by 'Tab' key
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Keybindings
" let mapleader = "z" " My binding
let mapleader = "\<Space>" " For better convinience

" Neotree, FZF, CodeRunner, CoC-git, Commentary keybindings 
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>k :q<CR>
nnoremap <Leader>l :call CocActionAsync('jumpDefinition')<CR>
nnoremap <Leader>p :vsplit \| term bash<CR>
nnoremap <Leader>b :botright split \| term bash<CR>
nnoremap <Leader>r :RunCode<CR>
nnoremap <Leader>i :Gitsigns preview_hunk_inline<CR>
nnoremap <Leader>o :Gitsigns preview_hunk<CR>
nnoremap <Leader>u :Gitsigns reset_hunk<CR>
nnoremap <Leader>a :Neotree focus<CR>
nnoremap <Leader>q :Neotree toggle<CR>
nnoremap <C-q> :Neotree toggle<CR>
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>

nmap <F8> :TagbarToggle<CR>


" For selecting lines and string by 'h,j,k,l' keys 
nnoremap <S-h> vh
nnoremap <S-j> vj
nnoremap <S-k> vk
nnoremap <S-l> vl


" Save, Cut, Undo, Redo, Selection & Yank keybindings
vmap <C-h> iw
vmap <C-l> iw
noremap  <C-v> "+p
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


" <------------------------------Airline----------------------------->
" Air-line
let g:airline_theme='shades_of_purple' 
let g:airline_powerline_fonts = 1

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


" <------------------------------Autorefresh---------------------------->
autocmd BufWritePost * Gitsigns refresh
autocmd DirChanged * Gitsigns refresh
autocmd BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif


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


" <----------------------------Just some notes ---------------------------->
" :PlugClean :PlugInstall :UpdateRemotePlugins
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE
