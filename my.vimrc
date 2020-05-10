" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-python/python-syntax'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'adarsh/electric_boogaloo.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Start Pathogen
execute pathogen#infect()

let mapleader = ","

"Seriously, guys. It's not like :W is bound to anything anyway.                                                                                        
command! W :w

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
set splitbelow
set splitright

" ==========================================================
" Basic Settings 
" ==========================================================
syntax on                     " syntax highlighing
set numberwidth=1             " using only 1 column (and 1 space) while
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set autochdir

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc 

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=4 shiftwidth=4      " a tab is two spaces (or set this to 2)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one

set autoindent              " always set autoindenting on
set matchpairs+=<:>         " show matching <> (html mainly) as well

"" call pathogen#infect()
set hidden                  " allow switching buffers without saving

"" Ctrl+C after a visual selection copies to system clipboard
map <C-c> "+y<CR>

if has('gui_running')
  colorscheme solarized8
  set background=light
  set guifont=Monaco:h14
else
  colorscheme ron
  set background=dark
endif

"" CTRL P
set runtimepath^=~/.vim/bundle/ctrlp.vim
"" let g:ctrlp_cmd = 'CtrlPMRU'
nmap <leader>P :CtrlPBufTagAll<cr>
nmap <leader>G :CtrlPTag<cr>
let g:ctrlp_lazy_update = 1
let g:ctrlp_tabpage_position = 'al'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_max_files=0
set wildignore+=*/node_modules/*,*/.git/*,*.swp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.+(git|hg|svn|node_modules)$',
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nmap <leader>n :NERDTree<cr>
nmap <leader>m :NERDTree %<cr>
let g:NERDTreeWinSize = 40
let NERDTreeIgnore = ['\.pyc$']
au BufRead,BufNewFile *.module,*.inc,*.info set filetype=php

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeNodeDelimiter = "\u00a0"

"" Tagbar !
nmap <leader>t :TagbarOpen fj<cr>
let g:tagbar_left=1
let g:tagbar_type_php  = {
  \ 'ctagstype' : 'php',
  \ 'kinds'     : [
    \ 'i:interfaces',
    \ 'c:classes',
    \ 'd:constant definitions',
    \ 'f:functions',
    \ 'j:javascript functions:1'
  \ ]
\ }

"" http://www.held.org.il/blog/2011/02/configuring-ctags-for-python-and-vim/
set tags=~/.vim/mytags/tags
set laststatus=2

nmap <leader>a :Ack 

"" From http://stackoverflow.com/questions/7163947/vim-paste-multiple-times
xnoremap p pgvy

"" Function status line
let g:ctags_path="/usr/bin/ctags"
let g:ctags_statusline=1
let g:ctags_title=1

let g:php_localvarcheck_enable=1

let g:python_highlight_all = 1
nmap <leader>bl :Breakin ,<cr>

"" In any directory you can define .vim.custom to override vim settings
if filereadable(".vim.custom")
    so .vim.custom
endif
