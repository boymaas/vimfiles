" ------------------------------------------------------------------------------------------------------
" Fast navigation to a certain filetype inside rails
" ------------------------------------------------------------------------------------------------------
map <leader>gv :CommandTFlush<cr>\|:CommandT app/views<cr>
map <leader>gc :CommandTFlush<cr>\|:CommandT app/controllers<cr>
map <leader>gm :CommandTFlush<cr>\|:CommandT app/models<cr>
map <leader>gh :CommandTFlush<cr>\|:CommandT app/helpers<cr>
map <leader>gl :CommandTFlush<cr>\|:CommandT lib<cr>
map <leader>gp :CommandTFlush<cr>\|:CommandT public<cr>
map <leader>gs :CommandTFlush<cr>\|:CommandT app/stylesheets<cr>
map <leader>gt :CommandTFlush<cr>\|:CommandT spec<cr>
map <leader>go :e ~/Personal/Planning/gtd.org<cr>

map <leader>gr :topleft :split config/routes.rb<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>gd :topleft 100 :vsplit db/schema.rb<cr>

" ------------------------------------------------------------------------------------------------------
" Show rails routes in a seperate buffer
" ------------------------------------------------------------------------------------------------------
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  "":exec ":normal " . line("$") . " _ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>

" ------------------------------------------------------------------------------------------------------
" Run the tests
" ------------------------------------------------------------------------------------------------------
function! RunTestFile(...)
    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SweetVimRspecRun("File")
    else
        call SweetVimRspecRun("Previous")
    end
endfunction

function! RunNearestTest()
  call SweetVimRspecRun("Focused")
endfunction

" Run this file
map <leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader>T :call RunNearestTest()<cr>
" Run all test files
""map <leader>a :call RunTests('spec')<cr>
