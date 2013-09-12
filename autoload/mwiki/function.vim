
" function 
"
" Author: h2ero <122750707@qq.com>
" Last Change: 2013-09-11 09:36:04

"trim 
function! mwiki#function#trim(str)
    if match(a:str, '^\s*$') != -1
        return ""
    endif
    return substitute(a:str, '\(^\s*\|\s*$\)', '', 'g')
endfunction

"get string by regex and cursor, notice: this string contains space.
function! mwiki#function#GetCursorString(isContainSpace)
    if a:isContainSpace == "false"
        return expand("<cWORD>")
    endif
    "Step 1. check regex match string contains cursor string 
    "Step 2. get string  form regex match or cursor
    let cursorString = expand("<cword>")
    let pattern = '.*'.cursorString.'.*'
    let pattern = '\[\('.pattern.'\)]('.pattern.'\.md)'
    " let pattern = '.*'
    if match(getline("."), pattern) != -1
        return matchstr(getline("."), pattern)
    else
        return expand("<cWORD>")
    endif
endfunction
