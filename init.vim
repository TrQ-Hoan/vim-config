" '~/AppData/Local/nvim-data/plugged' is default path of folder vim-plug
call plug#begin('C:/Users/ABC/AppData/Local/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'Chiel92/vim-autoformat'
Plug 'preservim/nerdcommenter'
Plug 'pprovost/vim-ps1'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" themes
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
call plug#end()

syntax on
filetype on
scriptencoding UTF-8
set encoding=UTF-8
set t_Co=256
set mouse=a
set ruler
set list
set nu
set autoindent

map <silent><F2> :let @/ = ""<CR>
map <silent><F4> :NERDTreeToggle<CR>
inoremap <C-s> <esc>:w!<cr> " save files
nnoremap <C-s> :w!<cr>
inoremap <C-q> <esc>:wq!<cr> " save and exit
nnoremap <C-q> :wq!<cr>
inoremap <C-x> <esc>:qa!<cr> " quit discarding changes
nnoremap <C-x> :qa!<cr>
nnoremap <C-j> :m .+1<CR>== " move line
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

map <A-h> <C-W>h
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-l> <C-W>l

nnoremap <F3> :Autoformat<CR>

nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> :FloatermToggle<CR>
nnoremap <silent> <F11> :FloatermNew ranger<CR>
tnoremap <Esc> <C-\><C-n>
let g:floaterm_autoinsert = v:false

" build and run KEY
autocmd filetype c,cpp nnoremap <F6> :FloatermNew type in.txt \| %:r.exe<CR>
autocmd filetype c,cpp nnoremap <F7> :FloatermNew %:r.exe<CR>
autocmd filetype cpp nnoremap <F9> :!g++ -std=c++17 -Wshadow -Wall % -o %:r -O2 -Wno-unused-result<CR>
"autocmd filetype cpp nnoremap <F10> :!g++ -std=c++17 -Wshadow -Wall % -o %:r -g -fsanitize=address -fsanitize=undefined -D_GLIBCXX_DEBUG<CR>
autocmd filetype cpp nnoremap <F10> :FloatermNew g++ -g -ulimit -Wall -Wno-unused-result -std=c++17 -O2 % -o %:r && %:r.exe<CR>
autocmd filetype c nnoremap <F9> :!gcc -O2 -g -m32 -std=c11 -o %:r % -Wl,--strip-debug<CR>
autocmd filetype c nnoremap <F10> :FloatermNew gcc -g -O2 -std=c11 -o %:r % && %:r.exe<CR>
autocmd filetype python nnoremap <F7> :FloatermNew python3 %<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme='dark'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" air-line
let g:airline_powerline_fonts = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.linenr = '= '
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.whitespace = 'Ξ'

set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
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

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------

set number            " Enable line numbers
set relativenumber    " Current line number
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling
let g:python3_host_prog = 'C:\Users\ABC\AppData\Local\Programs\Python\Python38\python.exe'
let g:python_host_prog = 'C:\python27-x64'

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------

colorscheme xcodedarkhc
set termguicolors
set background=dark
" Showcase comments in italics
highlight Comment cterm=italic gui=italic
" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

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

if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 12
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
endif

