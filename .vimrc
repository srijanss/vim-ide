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

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

let maplocalleader = ","

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
"set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
retab
set noswapfile
"map <Leader>q :q!<Enter>
"map <Leader>w :w!<Enter>
"map <Leader>wq :wq!<Enter>
map <Leader>ct :s/^/#/<Enter>
map <Leader>ut :s/#//<Enter>
nmap <F9> :bNext<CR>
nmap <F6> :tnext<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F7> :NERDTreeToggle<CR>
map <Leader>n :CommandT<CR>
map <Leader>z :Dbg .<CR>
map <Leader>x :Dbg quit<CR>
map <Leader>s :w<CR>
map <Leader>q :q!<CR>
map <c-z> u
map <Leader>f :normal gg=G<CR>
map <Leader>c :setlocal noautoindent<CR>
map <Leader>cc :setlocal autoindent<CR>
map <c-t> :%retab!<CR>
imap <c-z> <esc>ui
nmap <c-f> :set foldmethod=indent<cr>
nnoremap <Leader>ev :vsplit $MYVIMRC<cr>
nnoremap <Leader>gv :source $MYVIMRC<cr>
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
    "autocmd BufNewFile *.py :execute "normal! Iimport\n\n\n\ndef\n\n\n\nif __name__ == \"__main__\":\n"
augroup END
set tags=tags
"let g:miniBufExplMapWindowNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplModSelTarget=1
"code folding
"set foldmethod=manual
"autocmd BufNewFile,BufRead *.py set foldmethod=indent
"map <Leader>f zc
"map <Leader>nf zo
"map <Leader>nt zR
"map <Leader>ft zM

if has("vms")
  set nobackup      " do not keep a backup file, use versions instead
else
  set nobackup      " keep a backup file
endif
set history=50      " keep 50 lines of command line history
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
  set mouse=a
endif

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
