function! ClojureAlternateForCurrentFile()
  let current_path = expand("%")
  let current_file = expand("%:t")
  let current_dir  = expand("%:h")
  let in_test = match(current_path, '^test/') != -1
  let going_to_test = !in_test
  if going_to_test
    let current_dir = substitute(current_dir, '^src/', 'test/', '') . '/test'
  else
    let current_dir = substitute(current_dir, '^test/', 'src/', '')
    let current_dir = substitute(current_dir, '/test/\?$', '', '')
  endif
  return current_dir . '/' . current_file
endfunction

function! ClojureOpenTestAlternate()
  let alternate = ClojureAlternateForCurrentFile()
  exec ':e ' . alternate
endfunction

function! ClojureRunTestFile()
    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '^test/') != -1
    echo in_test_file
    if in_test_file
        let t:clojure_test_namespace = b:vimclojure_namespace
    elseif !exists("t:clojure_test_namespace")
        return
    end

    let ns = t:clojure_test_namespace
    let result = call(function("vimclojure#ExecuteNailWithInput"),
          \ [ "RunTests", "", "-n", ns ])

    call vimclojure#ShowClojureResult(result, ns)
endfunction


nmap <buffer> <silent> <LocalLeader>. :call ClojureOpenTestAlternate()<cr>
nmap <buffer> <silent> <LocalLeader>t :call ClojureRunTestFile()<cr>


