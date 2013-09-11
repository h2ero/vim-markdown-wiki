"
" function 
"
" Author: h2ero <122750707@qq.com>
" Last Change: 2013-09-11 09:36:04

"trim 
function! mwiki#function#trim(str)
    if match(a:str, '^\s*$') != -1
        return ""
    endif
    return substitute(a:str, '^\s*\<\(.*\)\>\s*$', '\1', 'g')
endfunction
