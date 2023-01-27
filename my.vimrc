syntax on

set guicursor=
set noshowmatch
set nohlsearch
set hidden
set noerrorbells
"set tabstop=4 softtabstop=4
set tabstop=2 shiftwidth=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=0

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"" CocExtensions as of 7/23/20
"" ==============================
"" * coc-explorer 0.7.11
"" * coc-tsserver 1.5.1
"" * coc-prettier 1.1.14
"" * coc-flow 0.1.3
"" * coc-explorer 0.7.11
"" * coc-eslint 1.2.7
"" + coc-python 1.2.12
"" + coc-json 1.2.6
"" + coc-css 1.2.3


"" Intellisense
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"" Git
Plug 'tpope/vim-fugitive'

"" Others
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier'
Plug 'adarsh/electric_boogaloo.vim'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree'
Plug 'ap/vim-css-color'
Plug 'majutsushi/tagbar'

Plug 'flowtype/vim-flow'
Plug 'editorconfig/editorconfig-vim'

"" Colorscheme stuff
Plug 'gruvbox-community/gruvbox'

call plug#end()


"" ColorScheme stuffz 
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme gruvbox
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'hard'

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "
let loaded_matchparen = 1

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" ctrl-jklm  changes to that split
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
set splitbelow
set splitright

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>pg :Rg<SPACE>
nnoremap <Leader>ph :Rg<SPACE><C-r><C-w><CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

""" NerdTree
nmap <leader>n :NERDTree<cr>
nmap <leader>m :NERDTree %<cr>
let g:NERDTreeWinSize = 40
let NERDTreeIgnore = ['\.pyc$']

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeNodeDelimiter = "\u00a0"

""" bandaid https://github.com/preservim/nerdtree/issues/1321#issuecomment-1234980190
let g:NERDTreeMinimalMenu=1

"Seriously, guys. It's not like :W is bound to anything anyway.                                                                                        
command! W :w

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

nmap <leader>bl :Breakin ,<cr>

"" In any directory you can define .vim.custom to override vim settings
if filereadable(".vim.custom")
    so .vim.custom
endif

""command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>p :Prettier<cr>
nmap <leader>vi :tabe ~/.vimrc<cr>


" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

""function! s:check_back_space() abort
""  let col = col('.') - 1
""  return !col || getline('.')[col - 1]  =~# '\s'
""endfunction
""
""" GoTo code navigation.
""" " Use tab for trigger completion with characters ahead and navigate.
""" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
""" other plugin before putting this into your config.
""inoremap <silent><expr> <TAB>
""      \ pumvisible() ? "\<C-n>" :
""      \ <SID>check_back_space() ? "\<TAB>" :
""      \ coc#refresh()
""inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
""
""" Use <c-space> to trigger completion.
""inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)

" Run ESLint
nmap <silent> es <Plug>(coc-codeaction)

" tagbar
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_ctags_options = ['NONE', '--map-javascript=.jsx']

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
