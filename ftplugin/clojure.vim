
function! ClojureRunTestFile()
    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '^test/') != -1

    if in_test_file
      :Require
      :Eval (run-tests)
    else
      :A
      :Require
      :Eval (run-tests)
      :A
    endif
endfunction


nmap <buffer> <silent> <LocalLeader>. :A<cr>
nmap <buffer> <silent> <LocalLeader>t :call ClojureRunTestFile()<cr>


