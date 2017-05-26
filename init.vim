" execute pathogen#infect()
call plug#begin('~/.vim/plugins')
    " ALE
    Plug 'w0rp/ale'
    let g:ale_sign_column_always = 1

    Plug 'jiangmiao/auto-pairs'

    " Codi
    Plug 'metakirby5/codi.vim'
    let g:codi#interpreters = {'python': {'bin': '/usr/local/bin/python3'}}
    let g:codi#rightalign = 0

    "Complete
    Plug 'maralla/completor.vim'
    let g:completor_python_binary = '/usr/local/bin/python3'
    let g:completor_clang_binary = '/usr/bin/clang'
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

    " NERDTree
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plug 'Xuyuanp/nerdtree-git-plugin', {'on': 'NERDTreeToggle'}
    nmap ,l :NERDTreeToggle<CR>
    nmap ,r :NERDTreeFind<CR>

    "Tagbar
    Plug 'majutsushi/tagbar', {'on': 'Tagbar'}
    nmap ,t :Tagbar<CR>

    Plug 'tpope/vim-commentary'
    Plug 'ludovicchabant/vim-gutentags'

    "Ulti-snips
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    let g:UltiSnipsExpandTrigger="<s-tab>"
    let g:UltiSnipsJumpForwardTrigger="<s-tab>"

    " Goyo
    Plug 'junegunn/goyo.vim'
call plug#end()

syntax on
filetype plugin indent on

" Whitespace characters
set listchars=tab:⇥\
set list

" Normal backspace and tab
set backspace=indent,eol,start
set complete-=i
set autoindent
" >> will use spaces, pressing TAB will insert a tab
set tabstop=4
set expandtab
set shiftwidth=4

" No wrapping
set nowrap

" Ruler
set ruler

" Autodisplay colon commands
set wildmenu

" Line numbers
set number

" Searching stuff
set incsearch
set cursorline

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Automatically update files
set autoread

set autochdir
set path-=/usr/include
set path+=$PWD/**

" 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Remove whitespace
command RemoveWhitespace %s/\s\+$//e


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
if isdirectory(".lvim")
    source .lvim/vimrc
endif
