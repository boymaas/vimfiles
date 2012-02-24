" Some custom configurations or vim and some notes to remenber
"
" Insert mode cursor keys
" -----------------------
" 
" autoclose.vim plugin executes a mapping on a certain escape code. I had
" to disable this plugin to make sure vim will operate as expected inside
" a tmux session. (This took a few hours)
"
"" quickly navigate to directory relative to file
let mapleader='\'

map <leader>ls 	:cd <C-r>=expand("%:p:h")<CR>/:shell:cd -
map <leader>lc 	:cd <C-r>=expand("%:p:h")<CR>
map <leader>el 	:e <C-r>=expand("%:p:h")<CR>/
map <leader>q          :normal @q
map <leader>v          :e ~/.vim/plugin/boymaas.vim
map <leader>s          :source ~/.vim/plugin/boymaas.vim

map <leader>P "*p
map <leader>Y "*y

map ;; <c-^>
" map <leader><leader> <c-^>

map zz 

"" Need to get off this habit 
" map <Left> :echo "no!"<cr>
" map <Right> :echo "no!"<cr>
" map <Up> :echo "no!"<cr>
" map <Down> :echo "no!"<cr>


"" Quick jumping
map <C-k> 10k
map <C-j> 10j

"" Don't use ex-mode use gq for formatting
map Q gq

" Configure line numbers with 5 chars
set number
set numberwidth=5

" Make tab completion for files/buffers act like bash
set wildmenu
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

" Keep more context when scrolling off the end of a buffer
set scrolloff=3

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp


colorscheme tango2
"colorscheme solarized
se background=dark

se nohls

" show line where cursor is on
se cursorline

"" Fast window switchin
map <C-Right> <C-w>l
map <C-Left> <C-w>h
map <C-Up> <C-w>k
map <C-Down> <C-w>j

"""
call pathogen#helptags()

se pastetoggle=<F9>

"" Folding
se foldminlines=0

""" Windows
" set winwidth=84
" " We have to have a winheight bigger than we want to set winminheight. But if
" " we set winheight to be huge before winminheight, the winminheight set will
" " fail.
" set winheight=5
" set winminheight=5
" set winheight=999"

""" Powerline related settings 
""" XXX move to powerline.vim
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
"let g:Powerline_symbols = 'fancy'
