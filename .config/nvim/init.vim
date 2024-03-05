" <------------------------@tribhuwan-kumar------------------------>
" <-------------------------Neovim Settings------------------------->
:syntax on
:set wrap
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
:set updatetime=300
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
Plug 'norcalli/nvim-colorizer.lua' " Colorizer
Plug 'tc50cal/vim-terminal' " Vim Terminal
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'mg979/vim-visual-multi' " CTRL + N for multiple cursors
Plug 'akinsho/toggleterm.nvim' " For Terminal
Plug 'windwp/nvim-autopairs' " For auto closing ( [ {
Plug 'sheerun/vim-polyglot'  " Plugin for syntax highlighting and language features
Plug 'lewis6991/gitsigns.nvim' " For git tracking
Plug 'rest-nvim/rest.nvim' " HTTP Client
Plug 'nvim-lua/plenary.nvim' " For rest.nvim  
Plug 'aurum77/live-server.nvim' " Live Server
Plug 'gregsexton/MatchTag' " For matching html tags
Plug 'Pocco81/AutoSave.nvim' " Auto Save
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }  "For Highlighting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder

Plug 'tribhuwan-kumar/Code-runner-plugin-for-Nvim' " Code Runner

" Neotree
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

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

Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvim-lualine/lualine.nvim' " Lua line
Plug 'ThePrimeagen/harpoon' " Harpoon
Plug 'lukas-reineke/indent-blankline.nvim' " Indent line
Plug 'projekt0n/github-nvim-theme' " Github theme
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'} " Markdown preview
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " better syntax highlighting

" Debugger
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

" Language specific DAP
Plug 'mfussenegger/nvim-dap-python' " For python



Plug 'ryanoasis/vim-devicons' " Developer Icons
call plug#end()


" <-------------------------Paths & Variables-------------------------->
" paths
let g:tagbar_ctags_bin =  '/usr/bin/ctags' " Tagbar exburenant ctags path
let g:python3_host_prog = "/usr/bin/python3" " Python bin path

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
nnoremap <Leader>r :RunCode<CR>

" cursor navigation
:noremap j gj
:noremap k gk
" navigation in windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Prevent registering to clipboard
nnoremap S "_S
nnoremap c "_c
nnoremap d "_d
nnoremap D "_D
nnoremap C "_C
nnoremap X "+x
nnoremap xx "+Vx
nnoremap dd "_dd
" visual mode
vnoremap p "_dP
vnoremap d "_d
vnoremap D "_D
vnoremap c "_c

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
vnoremap <BS> "_d

" Alt + arrow Up/Down or 'j,k' to move line up and down
inoremap <M-Up> <Esc>:m-2<CR>==gi
inoremap <M-Down> <Esc>:m+<CR>==gi
nnoremap <M-Up> :m-2<CR>==
nnoremap <M-Down> :m+<CR>==
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv


" <-------------------------Tresssitter----------------------------->
lua require('tree-sitter-config')

" <--------------------------Colorscheme---------------------------->
lua require('theme-config')

" <----------------------------Colorizer----------------------------->
lua require('colorizer').setup()

" <-------------------------Autopairs------------------------->
lua require("nvim-autopairs").setup {}
lua require('autopairs-config')

" <------------------------------Autorefresh---------------------------->
autocmd BufWritePost * Gitsigns refresh
autocmd DirChanged * Gitsigns refresh
autocmd BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro


" <-----------------------------Autosave------------------------------------>
let g:auto_save = 1
let g:auto_save_events = ['InsertLeave', 'TextChanged']


" <----------------------------Lualine--------------------------------------->
lua require('lualine').setup()
lua require('lualine-config')

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
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")


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
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-python', 'coc-clangd', 'coc-copilot', 'coc-vimlsp']  " list of CoC extensions needed

" accept auto complete by 'Tab' key & move up and down by 'C-j' and 'C-k' keys, 'C-l' for jump to definition 
:imap <C-J> <C-n> 
:imap <C-K> <C-p>
nnoremap <Leader>l :call CocActionAsync('jumpDefinition')<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
" inoremap <silent><expr> <TAB> pumvisible() ? coc#_select_confirm() : "\<TAB>"


" <-----------------------------Harpoon------------------------------------>
" config
lua require("harpoon").setup()

" keybindings
nnoremap <Leader>a  :lua require("harpoon.mark").add_file()<CR>
nnoremap <Leader><Leader> :lua require("harpoon.ui").toggle_quick_menu()<CR>
" nnoremap <Leader>c :lua if vim.api.nvim_eval('pumvisible()') == 1 then require("harpoon.ui").nav_next() end<CR>
" nnoremap <Leader>c :lua if vim.api.nvim_eval('pumvisible()') == 1 then vim.api.nvim_command('setlocal nomodifiable') require("harpoon.ui").nav_next() vim.api.nvim_command('setlocal nomodifiable') end<CR>

" Use <Leader>n and <Leader>p for navigation when the Harpoon UI is open
nnoremap <Leader>w :lua require("harpoon.ui").nav_next()<CR>
nnoremap <Leader>e :lua require("harpoon.ui").nav_prev()<CR>


" <-----------------------------Indentline------------------------------------>
lua require("indentline-config")


" <-----------------------------Neotree------------------------------------>
" config
lua require("Neotree-config")

" keybindings
" nnoremap <Leader>w :Neotree focus<CR>
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
