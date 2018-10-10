call plug#begin('~/.vim/plugins')
    " ALE
    Plug 'w0rp/ale'
    let g:ale_sign_column_always = 1

    " Auto pairs
    Plug 'jiangmiao/auto-pairs'

    " Surround
    Plug 'tpope/vim-surround'

    " CtrlP
    Plug 'kien/ctrlp.vim'

    " NERDTree
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    nmap ,l :NERDTreeToggle<CR>
    nmap ,r :NERDTreeFind<CR>

    " Tags and commentary
    Plug 'tpope/vim-commentary'

    " Autocomplete
    Plug 'maralla/completor.vim'
    let g:completor_clang_binary = '/usr/bin/clang'
    let g:completor_python_binary = '/usr/local/bin/python3'
    let g:completor_node_binary = '/usr/local/bin/node'
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
call plug#end()

syntax on
filetype plugin indent on

" Whitespace characters
set listchars=tab:⇥\
set list

" Colours
colo slate

" Normal backspace and tab
set backspace=indent,eol,start
set complete-=i
set autoindent
" >> will use spaces, pressing TAB will insert a tab
set expandtab
set shiftwidth=4

" No better long line wrapping
set wrap
set linebreak
set showbreak=\ \ \ \ 

" Ruler
set ruler

" Autodisplay colon commands
set wildmenu

" Line numbers
set number

" Searching stuff
set incsearch

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Automatically update files
set autoread

set path-=/usr/include

" Remove whitespace
command! RemoveWhitespace %s/\s\+$//e


"""""""""""""" Filetype specific
" LaTeX
let g:tex_flavor='latex'
autocmd FileType tex set makeprg=pdflatex\ %\ &&\ open\ %:r.pdf
autocmd FileType tex set spell
autocmd FileType tex set tw=80
autocmd FileType tex let g:AutoPairs = {'(':')','[':']','{':'}',"'":"'",'"':'"','$':'$'}
autocmd FileType tex :command Bib !pdflatex % && bibtex %:r && pdflatex % && pdflatex %

" Python
autocmd FileType python set makeprg=python3\ %

" Matlab
autocmd FileType matlab setlocal commentstring=\%\ %s

""""""""""""""" Project Specific
if filereadable(".lvimrc")
    source .lvimrc
endif
        
