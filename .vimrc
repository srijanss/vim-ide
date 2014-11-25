" An example for a vimrc file.
"
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last change:  2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"         for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"       for OpenVMS:  sys$login:.vimrc
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"enable pathogen
call pathogen#helptags()
call pathogen#incubate()

"new settings added from nvie.com
set hidden
"set nowrap
set autoindent
set copyindent
set showmatch
set ignorecase
set smartcase
set smarttab
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells

"python tab completion using pydiction
filetype plugin on
let g:pydiction_location = '/home/srijan/.vim/bundle/pydiction/complete-dict'

"python documentation in vim
let g:pydoc_cmd = "/usr/bin/pydoc"


"javascript addition from http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
"au FileType javascript call JavaScriptFold()
let javascript_enable_domhtmlcss=0
let b:javascript_fold=1
let g:javascript_conceal=0
let javascript_ignore_javaScriptdoc=0
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=darkgrey
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red  ctermfg=243 ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermfg=243 ctermbg=233
"IndentGuidesToggle
map <C-i> :IndentGuidesToggle<CR>

"vim screen navigation shortcuts
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"disabled up down arrowsin vim
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>

imap <C-f> <C-o>0
imap <C-l> <C-o>$


"set list
"set listchars=tab:>.,trail:.,extends:#,nbsp:.

"if forgot to use sudo use w!!
cmap w!! w !sudo tee % >/dev/null

set t_Co=256
syntax on
set background=dark
colorscheme codeschool

set pastetoggle=<F2>

map <F4> :highlight Comment ctermfg=lightblue<CR>

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

let maplocalleader = ","

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"set smartindent
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab
retab
set noswapfile
"map <Leader>q :q!<Enter>
"map <Leader>w :w!<Enter>
"map <Leader>wq :wq!<Enter>
map <Leader>uf zR
map <Leader>ct :s/^/#/<Enter>
map <Leader>ut :s/#//<Enter>
nmap <F9> :bNext<CR>
nmap <F5> :cnext<CR>
nmap <F6> :tnext<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>
map <Leader>n :CommandT<CR>
"map <Leader>z :Dbg .<CR>
"map <Leader>x :Dbg quit<CR>
map <Leader>s :w<CR>
map <Leader>q :q!<CR>
map <c-z> u
map <Leader>f :normal gg=G<CR>
map <Leader>c :setlocal noautoindent<CR>
map <Leader>cc :setlocal autoindent<CR>
"map <c-t> :%retab!<CR>
map <Leader>ooo :vim /*/ **/*.* 
imap <c-z> <esc>ui
nmap <c-f> :set foldmethod=indent<cr>
nmap <silent> <Leader>ev :e $MYVIMRC<cr>
nmap <silent> <Leader>gv :so $MYVIMRC<cr>
nnoremap <Leader>eb :vsplit ~/.bashrc<cr>
nnoremap <Leader>\ :
augroup autocommand_group
    autocmd!
"    autocmd BufWritePre,BufRead *.html :normal gg=G
"    autocmd BufWritePre,BufRead *.py :normal gg=G
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript vnoremap <buffer> <localleader>c :s/^/\/\//<esc>
    autocmd FileType javascript vnoremap <buffer> <localleader>u :s/\/\///<esc>
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python vnoremap <buffer> <localleader>c :s/^/#/<esc>
    autocmd FileType python vnoremap <buffer> <localleader>u :s/#//<esc>
    autocmd FileType python set expandtab
    "autocmd BufNewFile *.py :execute "normal! Iimport\n\n\n\ndef\n\n\n\nif __name__ == \"__main__\":\n"
    "rainbow parenthesis for clojure
    autocmd FileType clojure au VimEnter * RainbowParenthesesToggle
    autocmd FileType clojure au Syntax * RainbowParenthesesLoadRound
    autocmd FileType clojure au Syntax * RainbowParenthesesLoadSquare
    autocmd FileType clojure au Syntax * RainbowParenthesesLoadBraces
     
augroup END
set tags=tags
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplModSelTarget=1
"code folding
"set foldmethod=manual
"autocmd BufNewFile,BufRead *.py set foldmethod=indent
map <Leader>f zc
map <Leader>nf zo
map <Leader>nt zR
map <Leader>ft zM

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set nobackup      " keep a backup file
endif
set history=1000      " keep 50 lines of command line history
set undolevels=1000
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set incsearch       " do incremental searching
set number
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse-=a
endif
set mouse=a

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\r") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif
