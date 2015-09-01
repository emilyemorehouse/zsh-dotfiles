"""""""""""""""""" Make Vim more useful
set nocompatible

"""""""""""""""""" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

"""""""""""""""""" Enhance command-line completion
set wildmenu

"""""""""""""""""" Allow cursor keys in insert mode
set esckeys

"""""""""""""""""" Allow backspace in insert mode
set backspace=indent,eol,start

"""""""""""""""""" Optimize for fast terminal connections
set ttyfast

"""""""""""""""""" Add the g flag to search/replace by default
set gdefault

"""""""""""""""""" Use UTF-8 without BOM
set encoding=utf-8 nobomb

"""""""""""""""""" Change mapleader
let mapleader=","

"""""""""""""""""" Don’t add empty newlines at the end of files
set binary
set noeol

"""""""""""""""""" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

"""""""""""""""""" Respect modeline in files
set modeline
set modelines=4

"""""""""""""""""" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

"""""""""""""""""" Enable line numbers
set number

"""""""""""""""""" Enable syntax highlighting
syntax on

"""""""""""""""""" Highlight current line
set cursorline

"""""""""""""""""" Make tabs as wide as two spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

"""""""""""""""""" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list

"""""""""""""""""" Highlight searches
set hlsearch

"""""""""""""""""" Ignore case of searches
set ignorecase

"""""""""""""""""" Highlight dynamically as pattern is typed
set incsearch

"""""""""""""""""" Always show status line
set laststatus=2

"""""""""""""""""" Enable mouse in all modes
set mouse=a

"""""""""""""""""" Disable error bells
set noerrorbells

"""""""""""""""""" Don’t reset cursor to start of line when moving around.
set nostartofline

"""""""""""""""""" Show the cursor position
set ruler

"""""""""""""""""" Don’t show the intro message when starting Vim
set shortmess=atI

"""""""""""""""""" Show the current mode
set showmode

"""""""""""""""""" Show the filename in the window titlebar
set title

"""""""""""""""""" Show the (partial) command as it’s being typed
set showcmd

"""""""""""""""""" General
set hidden
set nowrap
set autoindent
set copyindent
set number
set shiftround
set smartcase
set history=1000
set undolevels=1000
set visualbell
set fileformats=unix,dos,mac
set smartindent
set wildignore=*.swp,*.bak
set wildmode=longest,list

"""""""""""""""""" Use relative line numbers
"if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif

"""""""""""""""""" Start scrolling three lines before the horizontal window border
set scrolloff=3

"""""""""""""""""" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

"""""""""""""""""" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

"""""""""""""""""" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

"""""""""""""""""" Vundle things
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

"""""""""""""""""" VUNDLE Manages these Bundles
Bundle 'matchit.zip'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
"Bundle 'vim-powerline'
Bundle 'Command-T'
Bundle 'nvie/vim-rst-tables'

"""""""""""""""""""" PLUGINS
"let g:Powerline_symbols = 'fancy'
"let g:CommandTMaxFiles=5000
"let g:CommandTMaxHeight=12
"map <C-o> :CommandT<CR>
"let g:CommandTAcceptSelectionMap = '<CR>'
"let g:CommandTCancelMap = '<C-g>'
"
let NERDChristmasTree = 1
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']
nmap <c-e> :NERDTreeToggle<cr>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"nmap <C-n> <c-w><left><down><c-w><c-w>
"nmap <C-p> <c-w><left><up><c-w><c-w>
"nmap <C-o> <c-w><left><CR>
"

"""""""""""""""""""" KEYBINDINGS
map cc <leader>c<space>
map  # {v}! par 72<CR>
map  & {v}! par 72j<CR>
map  <F6> :setlocal spell! spelllang=en<CR>
map  <F12> :set invhls<CR>
cmap <C-g> <C-u><ESC>
command! -bang W w<bang>

""""""""""""""""""""" FILES SPECIFIC
au BufRead mutt-*        set ft=mail
au BufRead mutt-*        set invhls
au BufNewFile *.html 0r ~/.vim/templates/html.txt
au BufRead,BufNewFile *.jsm setfiletype javascript
au BufRead,BufNewFile *.xul setfiletype xml
au filetype html,xml set listchars-=tab:>.

""""""""""""""""""""""""" FOCUS MODE
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
    set laststatus=2
    set numberwidth=4
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . g:colors_name
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>" }

"""""""""""""""""""" CUSTOM FUNCTIONS
""" Toggle relative/absolute numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
nnoremap <F10> :call NumberToggle()<cr>


"""""""""""""""""" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
