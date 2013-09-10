"
" table  function 
"
" Last Change: 2013-09-10 10:46:11

" check cursor string is a table
function! mwiki#table#Is(str)
    if a:str == ""
        let str = getline(".")
    else
        let str = a:str
    endif
    if match(str, '^|.*|$') != -1
        return 1
    endif
    return 0
endfunction

