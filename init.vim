:syntax on
:set nowrap
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
:set mouse=nv
:set hlsearch
" :set clipboard=unnamed
" :set clipboard+=unnamedplus


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
Plug 'https://github.com/mg979/vim-visual-multi' " CTRL + N for multiple cursors
Plug 'https://github.com/rstacruz/vim-closer' " For brackets autocompletion
Plug 'https://github.com/akinsho/toggleterm.nvim' " For Terminal
Plug 'https://github.com/kaicataldo/material.vim' " material colorscheme 
Plug 'https://github.com/LunarVim/Neovim-from-scratch.git' " For vim terminal    
Plug 'https://github.com/tpope/vim-eunuch.git' " For filr operations

Plug 'ayu-theme/ayu-vim' " Ayu colorscheme 
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }  "For Highlighting
Plug 'nvim-tree/nvim-web-devicons' " Developer Icons
Plug 'jiangmiao/auto-pairs' " For auto closing ( [ {
Plug 'sheerun/vim-polyglot'  " Plugin for syntax highlighting and language features
Plug 'lewis6991/gitsigns.nvim' " For git tracking
Plug 'sonph/onehalf', { 'rtp': 'vim' } " Onehalf Theme
Plug 'Rigellute/shades-of-purple.vim' " Purple theme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'rest-nvim/rest.nvim'
Plug 'nvim-lua/plenary.nvim' 
Plug 'rafamadriz/friendly-snippets' " Snippets
Plug 'honza/vim-snippets' " Snippets
Plug 'L3MON4D3/LuaSnip' " Snippets
Plug 'hrsh7th/nvim-cmp'
Plug 'aurum77/live-server.nvim' " Live Server

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy finder
Plug 'Xuyuanp/nerdtree-git-plugin' " NerdTree git

Plug 'tribhuwan-kumar/Code-runner-plugin-for-Nvim' " Code Runner

" These plugins will add highlighting and indenting to JSX and TSX files.
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'

" Auto-completion For different file types 
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting


call plug#end()


let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']  " list of CoC extensions needed

" Keybindings
let mapleader = "z"

" NerdTree, FZF, CodeRunner, CoC-git, Exit keybindings 
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>k :q<CR>
nnoremap <Leader>l :call CocActionAsync('jumpDefinition')<CR>
nnoremap <Leader>p :vsplit \| term bash<CR>
nnoremap <Leader>b :botright split \| term bash<CR>
nnoremap <Leader>r :RunCode<CR>
nnoremap <Leader>i :CocCommand git.chunkInfo<CR>
nnoremap <Leader>u :CocCommand git.chunkUndo<CR>
nnoremap <Leader>a :NERDTreeFocus<CR>
nnoremap <C-q> :NERDTreeToggle<CR>

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


" Tab management
nnoremap <C-o> :tabn<CR>
nnoremap <C-i> :tabp<CR>
nnoremap <Leader>t :tabnew<CR>


" Cursor navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Coc-git tracking
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"


" Autocompletion for python
let g:python3_host_prog = "/usr/bin/python3"
":set g:python3_host_prog  " to avoid surprises


" Ayu Theme
" :colorscheme ayu      
" let ayucolor="light"  
" let ayucolor="mirage" 
" let ayucolor="dark"  


" shades_of_purple 
:colorscheme shades_of_purple 

" NerdTree icons
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

" NerdTree git
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ 'Modified'  :'✹',
      \ 'Staged'    :'✚',
      \ 'Untracked' :'✭',
      \ 'Renamed'   :'➜',
      \ 'Unmerged'  :'═',
      \ 'Deleted'   :'✖',
      \ 'Dirty'     :'✗',
      \ 'Ignored'   :'☒',
      \ 'Clean'     :'✔︎',
      \ 'Unknown'   :'?',
      \ }

let g:NERDTreeGitStatusConcealBrackets = 0 " default: 0

" Coc-git autorefresh
autocmd BufWritePost * CocCommand git.refresh
autocmd DirChanged * CocCommand git.refresh

