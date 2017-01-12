execute pathogen#infect()
syntax on
filetype plugin indent on

" Normal backspace and tab 
set backspace=indent,eol,start
set complete-=i
set autoindent
" >> will use spaces, pressing TAB will insert a tab
set tabstop=4
set expandtab
set shiftwidth=4

colorscheme evening

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

set path+=**
set wildmenu

" 80 characters
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" NERDTree
nmap ,l :NERDTreeToggle<CR>
nmap ,r :NERDTreeFind<CR>

"Tagbar
nmap ,t :Tagbar<CR>

" ALE
let g:ale_sign_column_always = 1
let g:al_sign_error = '!'
let g:al_sign_error = '>'

" Whitespace characters
set listchars=tab:⇥\ 
set list

"YCM
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_python_binary_path = 'python3'
