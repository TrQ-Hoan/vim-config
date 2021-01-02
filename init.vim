filetype off
set encoding=utf-8
set number
set relativenumber
set backspace=indent,eol,start
set guioptions=
set clipboard=unnamed
set cursorline
syntax on

map <A-h> <C-W>h
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-l> <C-W>l

call plug#begin('~/AppData/Local/nvim/plugged') " '~/AppData/Local/nvim/plugged' is path of folder vim-plug
Plug 'scrooloose/nerdtree'
Plug 'VundleVim/Vundle.vim'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'junegunn/fzf'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'vim-scripts/OmniCppComplete'
" Plug 'ycm-core/YouCompleteMe'
" Plug 'Raimondi/delimitMate'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'phanviet/vim-monokai-pro'
Plug 'morhetz/gruvbox'
Plug 'arzg/vim-colors-xcode'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'solarized_flood' " seoul256
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" air-line
let g:airline_powerline_fonts = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.linenr = '= '
" let g:airline_symbols.maxlinenr = '㏑'
" let g:airline_symbols.dirty='⚡'
let g:airline_symbols.whitespace = 'Ξ'


let g:conoline_color_normal_light = "ctermbg=240"
let g:conoline_color_normal_nr_light = "ctermbg=240 ctermfg=white"
let g:conoline_color_insert_light = "ctermbg=black"
let g:conoline_color_insert_nr_light = "ctermbg=red"

"set expandtab
"set shiftwidth=1
"set softtabstop=1
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
set autoindent

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']

autocmd FileType c,cpp setlocal expandtab shiftwidth=4 softtabstop=4 cindent 
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 autoindent
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

map <silent><F2> :source %<CR>
map <silent><F9> :NERDTreeToggle<CR>
nnoremap <c-z> :u<CR>						" undo
inoremap <c-z> <c-o>:u<CR>
inoremap <C-s> <esc>:w!<cr>					" save files
nnoremap <C-s> :w!<cr>
inoremap <C-q> <esc>:wq!<cr>				" save and exit
nnoremap <C-q> :wq!<cr>
inoremap <C-x> <esc>:qa!<cr>				" quit discarding changes
nnoremap <C-x> :qa!<cr>
nnoremap <A-j> :m .+1<CR>==					" move line
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

colorscheme xcodedarkhc
"autocmd VimEnter * call StartUp()
