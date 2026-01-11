" ========================================...Neovim Settings
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
set nocursorline
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
set grepformat=%f:%l:%c:%m


" ========================================...Plugins using VIM-PLUG
call plug#begin()

Plug 'tpope/vim-dadbod'                                                                       " Databases support
Plug 'tpope/vim-repeat'                                                                       " Repeat support
Plug 'preservim/tagbar'                                                                       " Tagbar & code navigation
Plug 'L3MON4D3/LuaSnip'                                                                       " Snippets engine
Plug 'tpope/vim-dotenv'                                                                       " Dotenv
Plug 'junegunn/fzf.vim'                                                                       " FZF vim
Plug 'hrsh7th/nvim-cmp'                                                                       " Completion
Plug 'hrsh7th/cmp-path'                                                                       " Path completion
Plug 'prisma/vim-prisma'                                                                      " Prisma
Plug 'stevearc/oil.nvim'                                                                      " File explorer
Plug 'github/copilot.vim'                                                                     " Copilot
Plug 'honza/vim-snippets'                                                                     " Snippets
Plug 'tpope/vim-surround'                                                                     " Surrounding ysw
Plug 'hrsh7th/cmp-buffer'                                                                     " Buffer completion
Plug 'onsails/lspkind.nvim'                                                                   " LSP icons
Plug 'MunifTanjim/nui.nvim'                                                                   " UI component library
Plug 'hrsh7th/cmp-nvim-lsp'                                                                   " LSP completion
Plug 'lifepillar/pgsql.vim'                                                                   " PostgreSQL syntax highlighting
" Plug 'wnkz/monoglow.nvim'                                                                   " Monochrome theme
Plug 'stevearc/conform.nvim'                                                                  " Formatter
Plug 'oysandvik94/curl.nvim'                                                                  " Curl
Plug 'nvim-neotest/nvim-nio'                                                                  " Asynchronous IO
Plug 'nvim-lua/plenary.nvim'                                                                  " Pop-up api
Plug 'numToStr/Comment.nvim'                                                                  " Better Commenting
Plug 'neovim/nvim-lspconfig'                                                                  " Native LSP
Plug 'segeljakt/vim-silicon'                                                                  " Screenshot
Plug 'windwp/nvim-autopairs'                                                                  " Auto closing pairs
Plug 'windwp/nvim-ts-autotag'                                                                 " Auto rename tags
Plug 'pocco81/auto-save.nvim'                                                                 " Auto Save
Plug 'mg979/vim-visual-multi'                                                                 " Multiple cursors
Plug 'tribhuwan-kumar/harpoon'                                                                " File tracking
Plug 'zapling/mason-lock.nvim'                                                                " Mason lock
Plug 'williamboman/mason.nvim'                                                                " LSP installer
Plug 'Jezda1337/nvim-html-css'                                                                " HTML completion
Plug 'aurum77/live-server.nvim'                                                               " Live Server
Plug 'mistweaverco/kulala.nvim'                                                               " Http client
Plug 'rasulomaroff/cmp-bufname'                                                               " Bufname completion
Plug 'AndrewRadev/tagalong.vim'                                                               " Auto rename tags
Plug 'saadparwaiz1/cmp_luasnip'                                                               " Snippets completion
Plug 'tribhuwan-kumar/matchtags'                                                                " Highlights matching tags
Plug 'nvim-tree/nvim-web-devicons'                                                            " Web icons
Plug 'tribhuwan-kumar/vim-airline'                                                            " Status bar
Plug 'rafamadriz/friendly-snippets'                                                           " Snippets
Plug 'kristijanhusak/vim-dadbod-ui'                                                           " vim-dadbod UI
Plug 'lukas-reineke/lsp-format.nvim'                                                          " Formatter
Plug 'CopilotC-Nvim/CopilotChat.nvim'                                                         " Copilot chat
Plug 'christoomey/vim-tmux-navigator'                                                         " Tmux navigator
Plug 'tribhuwan-kumar/NVIMColorPicker'                                                        " Color Picker
Plug 'williamboman/mason-lspconfig.nvim'                                                      " Mason LSP
Plug 'brenoprata10/nvim-highlight-colors'                                                     " Highlights colors
Plug 'lukas-reineke/indent-blankline.nvim'                                                    " Indents line
Plug 'kristijanhusak/vim-dadbod-completion'                                                   " DB compeletion
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }                                                " Better theme
Plug 'romgrk/fzy-lua-native', { 'do': 'make' }                                                " Lua native fuzzy finder
Plug 'JoosepAlviste/nvim-ts-context-commentstring'                                            " Tsx, Jsx commenting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                                           " Fuzzy finder
Plug 'gelguy/wilder.nvim', { 'do': 'UpdateRemotePlugins' }                                    " Commands fuzzy finder
" Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }                               " MCP
Plug 'lewis6991/gitsigns.nvim', { 'branch': 'main', 'commit': 'e44821b' }                     " Git Signs
Plug 'tribhuwan-kumar/neo-tree.nvim', { 'branch': 'main', 'commit': '95835a8' }               " File System
Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'master', 'do': ':TSUpdate' }             " Better syntax highlighting
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'bun install'}        " Markdown preview
Plug 'ryanoasis/vim-devicons'                                                                 " Developer icons ----> This should be at the end

call plug#end()


" ========================================...Paths
let g:python3_host_prog = "/usr/bin/python3"


" ========================================...Keybindings
let mapleader = "\<Space>"

" Help doc
nnoremap <Leader>h K<CR>

" Exit by 'Esc' in terminal mode
tnoremap <C-g> <C-\><C-n>

" Open recent file
nnoremap <Leader>or :edit #<1<CR>

" Cursor navigation
noremap j gj
noremap k gk

" Tab navigation
nnoremap <C-p> :tabn<CR>
nnoremap <C-[> :tabp<CR>

" Navigation in windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" FZF, Wrap, Tagbar, Visual-Block, Oil
nnoremap <Leader><Esc> :noh<CR>
nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>z :Buffers<CR>
nnoremap <Leader>k :q<CR>
nnoremap <Leader>c :Oil --float<CR>
nnoremap <Leader>b :botright split \| terminal<CR>
nnoremap <Leader>R :source ~/.config/nvim/init.vim<CR>
nnoremap <Leader><Tab> :call ToggleTabWidth()<CR>

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

" Save, Selection
nnoremap <C-g> ggVG
vnoremap <BS> "_d
nnoremap <Leader>v ^vg_
nnoremap ,p o<ESC>p==

" Cut in REG
nnoremap xi( di(
nnoremap xi) di)
nnoremap xi[ di[
nnoremap xi] di]
nnoremap xi{ di{
nnoremap xi} di}
nnoremap xi< di<
nnoremap xi> di>
nnoremap xi" di"
nnoremap xi' di'
nnoremap xi` di`
nnoremap xiw diw
nnoremap xip dip
nnoremap xit dit
nnoremap xib di(
nnoremap xiB di{

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


" ========================================...Auto CMDs
autocmd BufRead,BufNewFile *.http set filetype=http
autocmd BufNewFile,BufRead * setlocal formatoptions-=ro
autocmd BufEnter copilot-chat set nocursorline
autocmd BufEnter,CursorHold,CursorHoldI *.* if mode() !=# 'c' | execute 'checktime' | endif


" ========================================...LSP
lua require("lsp-conf")

" Keybindings
nnoremap <Leader>l <C-]>
nnoremap <C-]> :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>r :lua vim.lsp.buf.rename()<CR>


" ========================================...Conform
lua require("conform-conf")


" ========================================...Kulala
lua require("kulala-conf")


" ========================================...Mason
lua require("mason-conf")


" ========================================...Oil
lua require("oil-conf")


" ========================================...Mason-Lock
lua require("mason-lock-conf")


" ========================================...Completion
lua require("completion-conf")


" ========================================...Snippets
lua require("luasnip-conf")


" ========================================...Indentline
lua require("indentline-conf")


" ========================================...Curl
lua require("curl-conf")


" ========================================...Rocks
lua require("rocks-conf")


" ========================================...Tresssitter
lua require('tree-sitter-conf')


" ========================================...Colorscheme
lua require('theme-conf')
" lua require('monochrome-conf')


" ========================================...Colorizer
lua require('highlight-colors-conf')


" ========================================...Auto rename tags
lua require("ts-tag-conf")


" ========================================...Netrw
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_alto = 0
let g:netrw_preview = 1
let g:netrw_winsize = 15
let g:netrw_browse_split = 4


" ========================================...Tagbar
let g:tagbar_ctags_bin =  "/usr/bin/ctags"

" Keybindings
nmap <F1> :TagbarToggle<CR>


" ========================================...Autopairs
lua require('autopairs-conf')


" ========================================...Comment
lua require('comment-conf')

" Keybindings
vnoremap <Leader>/ :lua require('Comment.api').toggle.linewise()<CR>
nnoremap <Leader>/ :lua require('Comment.api').toggle.linewise()<CR>


" ========================================...Neotree
lua require("neotree-conf")

" Keybindings
nnoremap <C-q> :Neotree toggle<CR>
nnoremap <C-c> :Neotree reveal_file=%<CR>


" ========================================...Gitsigns
lua require("gitsigns-conf")
set statusline+=%{get(b:,'gitsigns_status','')}
autocmd BufWritePost,DirChanged,DiffUpdated * Gitsigns refresh

" Keybindings
nnoremap <Leader>i :Gitsigns preview_hunk_inline<CR>
nnoremap <Leader>o :Gitsigns preview_hunk<CR>
nnoremap <Leader>u :Gitsigns reset_hunk<CR>
nnoremap <Leader>n :Gitsigns next_hunk<CR>
nnoremap <Leader>m :Gitsigns prev_hunk<CR>
nnoremap gs :Gitsigns stage_hunk<CR>
nnoremap gr :Gitsigns undo_stage_hunk<CR>


" ========================================...Harpoon
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


" ========================================...Markdown
let g:instant_markdown_theme = 'dark'
let g:instant_markdown_autostart = 0
let g:instant_markdown_allow_unsafe_content = 1


" ========================================...Copilot & Copilot chat
lua require("copilot-chat-conf")
let g:copilot_no_tab_map = v:true
autocmd BufRead * Copilot disable

" Keybindings
imap <Nop> <Plug>(copilot-accept-word)
nnoremap <Leader>gg :CopilotChatToggle<CR>
imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")


" ========================================...ColorPicker
let g:NVIMColorPicker#InsertBefore#TheCursor = 1

" Keybindings
nnoremap <Leader>s :ColorPicker<CR>
vnoremap <Leader>s :ColorPicker<CR>
inoremap <C-c> <C-o>:ColorPicker<CR>


" ========================================...Preview
function! OpenPreview()
	setlocal previewheight=1
	let l:line = line('.')
	execute 'pedit +' . l:line . ' %'
endfunction

" Keybindings
nnoremap <silent> gp :call OpenPreview()<CR>
nnoremap gq :pclose<CR>


" ========================================...Tabwidth
function! ToggleTabWidth()
  if &tabstop == 2
    set tabstop=4 shiftwidth=4 softtabstop=4
    echo "Tab width set to 4"
  else
    set tabstop=2 shiftwidth=2 softtabstop=2
    echo "Tab width set to 2"
  endif
endfunction


" ========================================...Highlight Tags
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'eruby' : 1,
      \ 'django' : 1,
      \ 'svelte' : 1,
      \ 'htmldjango' : 1,
      \ 'typescriptreact' : 1,
      \ 'javascriptreact' : 1,
      \}


" ========================================...Folds
augroup RememberFolds
	autocmd!
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent! loadview
augroup END


" ========================================...Sources
let config_dir = stdpath("config") . "/vim/"
for file in glob(config_dir . "*.vim", 1, 1)
  execute "source " . file
endfor

" ========================================...Vim Tmux Navigator
let g:tmux_navigator_preserve_zoom = 1
let g:tmux_navigator_disable_when_zoomed = 1
