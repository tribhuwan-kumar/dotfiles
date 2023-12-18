:syntax on
:set number
:set autoread
:set smarttab
:set splitright
:set autoindent
:set termguicolors
:set mouse=a
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set encoding=UTF-8
:set completeopt-=preview " For No Previews
:set clipboard=unnamedplus
" :set clipboard=unnamed


call plug#begin()


Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/rstacruz/vim-closer' " For brackets autocompletion
Plug 'https://github.com/nvim-tree/nvim-tree.lua' " For file tree
Plug 'https://github.com/akinsho/toggleterm.nvim' " For Terminal
Plug 'https://github.com/ayu-theme/ayu-vim'  " For ayu_dark theme
Plug 'https://github.com/kaicataldo/material.vim' " material colorscheme 
Plug 'https://github.com/LunarVim/Neovim-from-scratch.git' " For vim terminal    
Plug 'https://github.com/tpope/vim-eunuch.git' " For filr operations

Plug 'michaelb/sniprun', { 'do': 'bash install.sh' } " Code Runner plugin
Plug 'ayu-theme/ayu-vim' " For colorscheme or other package manager
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }  "For Highlighting
Plug 'nvim-tree/nvim-web-devicons' "For Developer Icons
Plug 'jiangmiao/auto-pairs' "this will auto close ( [ {
Plug 'sheerun/vim-polyglot'  " Plugin for syntax highlighting and language features
Plug 'lewis6991/gitsigns.nvim' " For git tracking
Plug 'sonph/onehalf', { 'rtp': 'vim' } " Onehalf Theme
Plug 'Rigellute/shades-of-purple.vim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'CRAG666/code_runner.nvim'
Plug 'rest-nvim/rest.nvim'
Plug 'nvim-lua/plenary.nvim'


" ------------
" Python Runner
Plug 'tribhuwan-kumar/Code-runner-plugin-for-Nvim'
" Python Runner
" ------------

" These plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Auto-completion For Javascript
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting


call plug#end()


let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

" Keybindings
nmap <F8> :TagbarToggle<CR>
noremap  <C-v> "+p
nnoremap <C-c> yy
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-p> :vsplit \| term bash<CR>
nnoremap <C-b> :botright split \| term bash<CR>
nnoremap <C-k> :q<CR>
nnoremap <C-s> :w<CR>


" For selecting line by 'h,j,k,l' keys in insert mode
nnoremap <S-h> vh
nnoremap <S-j> vj
nnoremap <S-k> vk
nnoremap <S-l> vl


" Undo, Redo, Selection & Yank keybinding
nnoremap <C-a> ggVG
nnoremap <C-z> u
nnoremap <C-S-z> r
nnoremap <C-x> dd
vnoremap <C-x> x
vnoremap <C-c> "+y
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>


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


:set completeopt-=preview " For No Previews

" Autocompletion for python
let g:python3_host_prog = "/usr/bin/python3"
":set g:python3_host_prog  " to avoid surprises


" Ayu Theme
" :colorscheme ayu      " For themes
" let ayucolor="light"  " For light version of theme
" let ayucolor="mirage" " For mirage version of theme
" let ayucolor="dark"   " For dark version of theme


" shades_of_purple 
:colorscheme shades_of_purple 


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"


" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE


" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" Coc-git tracking
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


" For onehalf dark theme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


" Clipboard 
let g:clipboard = {
     \  'name': 'xclip',
     \  'copy': {
     \     '+': 'xclip -selection clipboard',
     \     '*': 'xclip -selection primary',
     \   },
     \  'paste': {
     \     '+': 'xclip -selection clipboard -o',
     \     '*': 'xclip -selection primary -o',
     \  },
     \  'cache_enabled': 1,
     \ }


" NerdTree Autorefresh
autocmd BufWritePost * NERDTreeRefresh
autocmd DirChanged * NERDTreeRefresh
autocmd CursorHold * NERDTreeRefresh

