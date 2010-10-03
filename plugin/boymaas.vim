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
map \ls 	:cd <C-r>=expand("%:p:h")<CR>/:shell:cd -
map \el 	:e <C-r>=expand("%:p:h")<CR>/
map \q          :normal @q
map \v          :e ~/.vim/plugin/boymaas.vim
map \s          :source ~/.vim/plugin/boymaas.vim

map \n          :cnext

map \P :.!xclip -o  -selection clipboard<cr>
map \Y :w !xclip -i  -selection clipboard<cr><cr>

colorscheme tango2
se nohls

"" Fast window switchin
map <C-Right> <C-w>l
map <C-Left> <C-w>h
map <C-Up> <C-w>k
map <C-Down> <C-w>j

"""
call pathogen#helptags()

se pastetoggle=<F9>

""" This is needed for MacOSX terminal within
""" Tmux
set notimeout		" don't timeout on mappings
set ttimeout		" do timeout on terminal key codes
set timeoutlen=100	" timeout after 100 msec
