call plug#begin('~/.vim/plugged') " '~/.vim/plugged' is path of folder vim-plug
Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf'
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'Chiel92/vim-autoformat'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'jackguo380/vim-lsp-cxx-highlight'
" theme
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'morhetz/gruvbox'
Plug 'overcache/NeoSolarized'
Plug 'NLKNguyen/papercolor-theme'
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
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Fix ^M in linux: perl -p -i -e "s/\r//g" ~/.vimrc

"---------------------
" Custom Mapping
"---------------------
map <silent><F1> :NERDTreeToggle<CR>
map <silent><F2> :let @/ = ""<CR> 
inoremap <C-s> <esc>:w!<cr>                " save files
nnoremap <C-s> :w!<cr>
inoremap <C-q> <esc>:wq!<cr>               " save and exit OR using 'ZZ'
nnoremap <C-q> :wq!<cr>
inoremap <C-x> <esc>:qa!<cr>               " quit discarding changes OR using 'ZQ'
nnoremap <C-x> :qa!<cr>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
nnoremap <C-h> :vertical res +5<CR>
nnoremap <C-l> :vertical res -5<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
inoremap <C-Left> <Esc> :tabprevious<CR>
inoremap <C-Right> <Esc> :tabnext<CR>
map <A-h> <C-w>h
map <A-l> <C-w>l
map <A-k> <C-w>k
map <A-j> <C-w>j
"---------------------

" Fast comment
" comment '\cc'
" uncomment '\cu'
"
" undo 'u'
" redo 'ctrl + r'

let g:lsp_cxx_hl_use_text_props = 1

" icons
let g:webdevicons_enable = 1

" floaterm
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> :FloatermToggle<CR>
nnoremap <silent> <F11> :FloatermNew ranger<CR>
tnoremap <Esc> <C-/><C-n>
let g:floaterm_autoinsert = v:false
let delimitMate_expand_cr = 1

" build file
autocmd filetype asm let g:asmsyntax = 'nasm'
autocmd filetype asm set filetype=nasm
autocmd filetype asm nnoremap <F5> :!./%:r<CR>
autocmd filetype asm nnoremap <F9> :!nasm -f elf % && ld -m elf_i386 %:r.o -o %:r<CR>
autocmd filetype asm nnoremap <F10> :!nasm -f elf % && ld -m elf_i386 %:r.o -o %:r && ./%:r <CR>
autocmd filetype c nnoremap <F5> :FloatermNew ./a <CR>
autocmd filetype c nnoremap <F9> :!gcc -g -std=c11 -o a % -O2<CR>
autocmd filetype c nnoremap <F10> :FloatermNew gcc -g -O2 -std=c11 -o a % && ./a<CR>
autocmd filetype cpp nnoremap <F5> :FloatermNew ./a<CR>
autocmd filetype cpp nnoremap <F9> :!g++ -g -ulimit -Wall -Wno-unused-result -std=gnu++17 -O2 % -o a<CR>
autocmd filetype cpp nnoremap <F10> :FloatermNew g++ -g -ulimit -Wall -Wno-unused-result -std=gnu++17 -O2 % -o a && ./a<CR>
autocmd filetype python nnoremap <F5> :FloatermNew python3 %<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#branch#enabled = 1
"let g:airline_theme='fruit_punch'
"let g:airline_theme='base16_adwaita'
let g:airline_theme='gruvbox'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" autoformat
nnoremap <F3> :Autoformat<CR>

" air-line
let g:airline_powerline_fonts = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.linenr = '☰ '
"let g:airline_symbols.maxlinenr = '㏑'
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

" syntax on
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
set relativenumber    " Current line number 
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
"let g:lightline = { 'colorscheme': 'onehalfdark' }
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

" tabs size
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab

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

" Coc settings -----------------------------------------------------------------
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
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

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" ------------------------------------------------------------------------------

if has('nvim')
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors
    colorscheme gruvbox
    set background=dark
    let g:gruvbox_constrast_dark = 'hard'
    let g:gruvbox_italicize_comments = 1

    " Fix vim-tmux-navigator <C-h> https://git.io/viGRU
    nmap <BS> <C-W>h

    " Fix vim-tmux-navigator <C-h> https://git.io/vS5QH
    nmap <BS> :<C-u>TmuxNavigateLeft<CR>
endif
