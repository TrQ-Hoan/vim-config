syntax on
set t_Co=256

"-------------------------------------------------------------------------------
"	My map
"-------------------------------------------------------------------------------
map <silent><F2> :source %<CR>
map <silent><F9> :NERDTreeToggle<CR>
inoremap <C-s> <esc>:w!<cr>                 " save files
nnoremap <C-s> :w!<cr>
inoremap <C-q> <esc>:wq!<cr>               " save and exit
nnoremap <C-q> :wq!<cr>
inoremap <C-x> <esc>:qa!<cr>               " quit discarding changes
nnoremap <C-x> :qa!<cr>
"map <C-x> <C-w>q
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-k> <C-w>k
map <C-j> <C-w>j

set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent
"---------------------

call plug#begin('~/.vim/plugged') " '~/.vim/plugged' is path of folder vim-plug
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf'
Plug 'mhinz/vim-signify'
"theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
"let g:airline_theme='base16_adwaita'
let g:airline_theme='fruit_punch' "base16_adwaita
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
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.dirty='⚡'
let g:airline_symbols.whitespace = 'Ξ'
"=========================
" Leader Mappings
map <Space> <leader>
map <Leader>w :update<CR>
map <Leader>q :qall<CR>
map <Leader>gs :Gstatus<CR>

" Recently edited files
map <Leader>h :History<CR>

" CtrlP use FZF (faster!)
nnoremap <C-p> :Files<Cr>

autocmd Filetype scss if getfsize(@%) > 300 | setlocal syntax=OFF | endif


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
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere
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

"-------------------------------------------------------------------------------
" Interface
"-------------------------------------------------------------------------------

set number            " Enable line numbers
set scrolloff=5       " Leave 5 lines of buffer when scrolling
set sidescrolloff=10  " Leave 10 characters of horizontal buffer when scrolling

"-------------------------------------------------------------------------------
" Colors & Formatting
"-------------------------------------------------------------------------------

"colorscheme gruvbox
"colorscheme onehalfdark
"colorscheme onehalflight
colorscheme PaperColor
"let g:airline_theme='onehalfdark'
"    lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }
set background=light
"set background=dark

" Showcase comments in italics
highlight Comment cterm=italic gui=italic

" Open most recently used files on start
" autocmd VimEnter * Mru .

" Easy tab navigation
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Golang specific settings
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_type_info = 1

let g:go_fmt_command = "goimports"


" Find/replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>

" let g:auto_save = 1  " enable AutoSave on Vim startup
" let g:auto_save_in_insert_mode = 0 " do not save in insert mode

" Get off my lawn - helpful when learning Vim :)
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>
"
"-------------------------------------------------------------------------------
" Neovim-specific configurations
"-------------------------------------------------------------------------------

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  set termguicolors
  colorscheme NeoSolarized
  set background=dark

  " Fix vim-tmux-navigator <C-h> https://git.io/viGRU
  nmap <BS> <C-W>h

  " Fix vim-tmux-navigator <C-h> https://git.io/vS5QH
  nmap <BS> :<C-u>TmuxNavigateLeft<CR>
endif