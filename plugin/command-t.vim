" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>gb :CommandTFlush<cr>\|:CommandTBuffer<cr>
" Open files, limited to the directory of the current file, with <leader>gf
" This requires the %% mapping found below.
map <leader>gf :CommandTFlush<cr>\|:CommandT %:h<cr>
