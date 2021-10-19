"syntax on
"filetype on
set nocompatible
scriptencoding UTF-8
set encoding=UTF-8
set t_Co=256
set autochdir
set mouse=a
set number            " Enable line numbers
set relativenumber    " Current line number
set autoindent
set guifont=Iosevka\ Donald:h11

" '~/AppData/Local/nvim-data/plugged' is default path of folder vim-plug
call plug#begin('C:/Users/ABC/AppData/Local/nvim/plugged')
    "Plug 'scrooloose/nerdtree'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/vim-easy-align'
    "Plug 'junegunn/vim-github-dashboard'
    Plug 'itchyny/lightline.vim'
    Plug 'mengelbrecht/lightline-bufferline'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    "Plug 'tpope/vim-fugitive'
    "Plug 'airblade/vim-gitgutter'
    "Plug 'mhinz/vim-signify'
    Plug 'Chiel92/vim-autoformat'
    Plug 'Yggdroot/indentLine'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
    Plug 'voldikss/vim-floaterm'
    " {{{ highlight }}}
    Plug 'sheerun/vim-polyglot'
    Plug 'gcollura/vim-masm'
    " {{{ themes }}}
    Plug 'arzg/vim-colors-xcode'
call plug#end()

map      <silent><F2> :let @/ = ""<CR>
map      <silent><F4> :NvimTreeToggle<CR>
nmap     ga           <Plug>(EasyAlign)
xmap     ga           <Plug>(EasyAlign)
map      <Space>      <leader>
nnoremap <Leader>w    :update<CR>
nnoremap <Leader>q    :q<CR>
nnoremap <Leader>x    :qall<CR>
vmap     <Leader>y    "+y
nnoremap <Leader>y    "+yy
nnoremap <Leader>p    "+p
nnoremap <C-j>        :m .+1<CR>== " move line
nnoremap <C-k>        :m .-2<CR>==
inoremap <C-j>        <Esc>:m .+1<CR>==gi
inoremap <C-k>        <Esc>:m .-2<CR>==gi
vnoremap <C-j>        :m '>+1<CR>gv=gv
vnoremap <C-k>        :m '<-2<CR>gv=gv
nnoremap <silent>     <TAB> :bnext<CR>
nnoremap <silent>     <S-TAB> :bprevious<CR>
nnoremap <C-Left>     :tabprevious<CR>
nnoremap <C-Right>    :tabnext<CR>

map <A-h> <C-W>h
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-l> <C-W>l

" start nvim-tree
autocmd VimEnter * lua require'nvim-tree'.setup()

" install astyle in choco
nnoremap <F3> :Autoformat<CR>
let g:formatdef_c_astyle    = '"astyle --style=google -pcHs4"'
let g:formatters_cpp        = ["c_astyle"]
let g:formatters_c          = ["c_astyle"]
let g:formatdef_java_astyle = '"astyle --mode=java --style=java -pcHs4"'
let g:formatters_java       = ["java_astyle"]

nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> :FloatermToggle<CR>
nnoremap <silent> <F11> :FloatermNew ranger<CR>
tnoremap <Esc> <C-\><C-n>
let g:floaterm_autoinsert = v:false

autocmd BufReadPost *.asm  set syntax=masm

" build and run KEY
autocmd filetype vim    nnoremap <F6>  :call histdel('/') \| source %<CR>
autocmd filetype c,cpp  nnoremap <F6>  :FloatermNew type in.txt \| %:r.exe<CR>
autocmd filetype c,cpp  nnoremap <F7>  :FloatermNew %:r.exe<CR>
autocmd filetype cpp    nnoremap <F9>  :!g++ -std=c++17 -Wshadow -Wall % -o %:r -O2 -Wno-unused-result<CR>
autocmd filetype cpp    nnoremap <F10> :!g++ -std=c++17 -Wshadow -Wall % -o %:r -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR>
autocmd filetype cpp    nnoremap <F10> :FloatermNew g++ -g -ulimit -Wall -Wno-unused-result -std=c++17 -O2 % -o %:r && %:r.exe<CR>
autocmd filetype c      nnoremap <F9>  :!gcc -O2 -g -m32 -std=c11 -o %:r % -Wl,--strip-debug<CR>
autocmd filetype c      nnoremap <F10> :FloatermNew gcc -g -O2 -std=c11 -o %:r % && %:r.exe<CR>
autocmd filetype python nnoremap <F7>  :FloatermNew python3 %<CR>

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '!'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_override_sign_column_highlight = 1

let g:python3_host_prog = 'C:\Users\ABC\AppData\Local\Microsoft\WindowsApps\python.exe'
let g:python_host_prog  = 'C:\Python27\python.exe'

set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection
set lcs=tab:\|\                       " char indentation guides/lines

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=100
set undoreload=1000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Colors & Formatting
colorscheme xcodedarkhc
set termguicolors
set showtabline=2
set background=dark
highlight Comment cterm=italic gui=italic
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }

" coc -----------------------------
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"----------------------------------
