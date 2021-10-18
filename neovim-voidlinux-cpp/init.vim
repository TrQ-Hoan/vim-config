set nocompatible
set encoding=UTF-8
set t_Co=256
set autochdir
set mouse=a
set number
set relativenumber
set termguicolors
set autoindent

call plug#begin('~/.config/nvim/plugged') " '~/.vim/plugged' is path of folder vim-plug
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'ryanoasis/vim-devicons'
    Plug 'voldikss/vim-floaterm'
    Plug 'itchyny/lightline.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'preservim/nerdcommenter'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
    " highlight syntax
    "Plug 'sheerun/vim-polyglot'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'vim-python/python-syntax'
    " theme | https://vimcolorschemes.com/
    Plug 'adrian5/oceanic-next-vim'
call plug#end()

" Fix ^M in linux: perl -p -i -e "s/\r//g" ~/.vimrc

" comment '\cc'
" uncomment '\cu'

" alignment 1st 'space'   == gaip<space>
" alignment 2nd 'space'   == gaip2<space>
" alignment last 'space'  == gaip-<space>
" Center-alignment around 2nd 'space' == gaip<Enter><Enter>2<Space>

" undo 'u'
" redo 'ctrl + r'
" <esc> <Ctrl>[

"---------------------
" Custom Mapping
"---------------------
nmap     ga           <Plug>(EasyAlign)
xmap     ga           <Plug>(EasyAlign)
map      <silent><F2> :let @/ = ""<CR>
map      <silent><F4> :NvimTreeToggle<CR>
"                     Leader Mappings
map      <Space>      <leader>
nnoremap <Leader>w    :update<CR>
nnoremap <Leader>q    :qall<CR>
vmap     <Leader>y    "+y
nnoremap <Leader>y    "+yy
nnoremap <Leader>p    "+p
nnoremap <C-j>        :m .+1<CR>==
nnoremap <C-k>        :m .-2<CR>==
inoremap <C-j>        <Esc>:m .+1<CR>==gi
inoremap <C-k>        <Esc>:m .-2<CR>==gi
vnoremap <C-j>        :m '>+1<CR>gv=gv
vnoremap <C-k>        :m '<-2<CR>gv=gv
nnoremap <C-h>        :vertical res +5<CR>
nnoremap <C-l>        :vertical res -5<CR>
nnoremap <C-Left>     :tabprevious<CR>
nnoremap <C-Right>    :tabnext<CR>
inoremap <C-Left>     <Esc> :tabprevious<CR>
inoremap <C-Right>    <Esc> :tabnext<CR>
map      <M-h>        <C-w>h
map      <M-l>        <C-w>l
map      <M-k>        <C-w>k
map      <M-j>        <C-w>j
"                     Find/replace
vnoremap <C-r>        "hy:%s/<C-r>h//g<left><left><left>
"        Ctrl         use FZF (faster!)
nnoremap <C-p>        :Files<Cr>
"        Tab          buffer previous.
nnoremap <silent>     <TAB> :bnext<CR>
nnoremap <silent>     <S-TAB> :bprevious<CR>
" Get off my lawn - helpful when learning Vim :)
nnoremap <Left>       :echoe "Use h"<CR>
nnoremap <Right>      :echoe "Use l"<CR>
nnoremap <Up>         :echoe "Use k"<CR>
nnoremap <Down>       :echoe "Use j"<CR>
"---------------------
if &fileformat == 'dos' && (has('win32') || has('win64'))
    autocmd VimEnter * set fileformat=unix
elseif has('win32') || has('win64')
    autocmd VimEnter * set fileformat=dos
else
    autocmd VimEnter * set fileformat=unix
endif

" start nvim-tree
autocmd VimEnter * lua require'nvim-tree'.setup()
" build file
autocmd filetype vim nnoremap <F5> :source %<CR>
autocmd filetype c,cpp nnoremap <silent> <F3> :%!astyle<CR>       " format code, install app astyle
autocmd filetype c,cpp nnoremap <F5> :FloatermNew ./a<CR>
autocmd filetype c nnoremap <F9> :!gcc -g -std=c11 % -o a -O2<CR>
autocmd filetype c nnoremap <F10> :FloatermNew gcc -g -O2 -std=c11 % -o a && ./a<CR>
autocmd filetype cpp nnoremap <F6> :!./a < in.txt<CR>
autocmd filetype cpp nnoremap <F9> :!g++ -std=gnu++17 -Wshadow -Wall % -o a -O2 -Wno-unused-result<CR>
autocmd filetype cpp nnoremap <F10> :FloatermNew g++ -std=gnu++17 -Wshadow -Wall -ulimit % -o a -O2 -g -Wno-unused-result && ./a<CR>
autocmd filetype python nnoremap <F5> :FloatermNew python3 %<CR>
" syntax on
autocmd Filetype scss if getfsize(@%) > 300 | setlocal syntax=OFF | endif

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
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab " Four space for tabs
set history=100
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection
set lcs=tab:\|\                       " char indentation guides/lines

" Persistent undo
set undodir=~/.config/nvim/undo/
set undofile
set undolevels=100
set undoreload=1000

" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

"---------------------
" Colors & Formatting
"---------------------
let g:oceanic_bold=1
let g:oceanic_for_polygot=1
let g:lightline = {'colorscheme': 'oceanicnext',}
set background=dark
colorscheme oceanicnext
highlight Comment cterm=italic gui=italic

" Coc settings -------
inoremap <slent><expr> <TAB>
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
