" execute pathogen#infect()
call plug#begin('~/.vim/plugins')
    " ALE
    Plug 'w0rp/ale'
    let g:ale_sign_column_always = 1

    " Auto pairs and surround
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'

    " Codi
    Plug 'metakirby5/codi.vim'
    let g:codi#interpreters = {'python': {'bin': '/usr/local/bin/python3'}}
    let g:codi#rightalign = 0

    " CtrlP
    Plug 'kien/ctrlp.vim'

    " Javascript
    Plug 'pangloss/vim-javascript'
    Plug 'vim-scripts/JavaScript-Indent'
    Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
    nmap <c-]> :TernDef<cr>
    nmap <c-^> :TernRefs<cr>

    " Fugitive
    Plug 'tpope/vim-fugitive'

    " NERDTree
    Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    nmap ,l :NERDTreeToggle<CR>
    nmap ,r :NERDTreeFind<CR>

    "Tagbar
    Plug 'majutsushi/tagbar', {'on': 'Tagbar'}
    nmap ,t :Tagbar<CR>

    " Tags and commentary
    Plug 'tpope/vim-commentary'

    " YouCompleteMe
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --clang-completer' }
    let g:ycm_global_ycm_extra_conf = "~/.vim/plugins/YouCompleteMe/third_party/ycmd/cpp/.ycm_extra_conf.py"

    "Ulti-snips
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    let g:UltiSnipsExpandTrigger="<s-tab>"
    let g:UltiSnipsJumpForwardTrigger="<s-tab>"

    Plug 'metakirby5/codi.vim'
    let g:codi#interpreters = {
                \ 'python': {
                \ 'bin': 'python3',
                \ 'prompt': '^\(>>>\|\.\.\.\) ',
                \ },
                \ }

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
set cursorline

set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Automatically update files
set autoread

set path-=/usr/include

" 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

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
