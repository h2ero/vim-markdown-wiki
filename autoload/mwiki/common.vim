"
" common  function 
"
" Author: h2ero <122750707@qq.com>
" Last Change: 2013-09-10 10:46:11

" create dir
function! mwiki#common#CreateDir(path)
    call mkdir(a:path, "p", 0755)
endfunction

" repace cursor string
function! mwiki#common#ReplaceCursorStr(replaceString)
    let replaceString = escape(a:replaceString,']\/*')
    exec 's/\S*\%#\S*/'.replaceString
endfunction

"
function! mwiki#common#GoToNext(flag)
    echo mwiki#table#Is("")
    " is it link
    if mwiki#link#Is("") == 1
        call search('\[[^\[^\]]*\]', 'ws'.a:flag)
    elseif  mwiki#table#Is("") == 1
        call search('|[^|^-]\+', 'ews'.a:flag)
    endif
endfunction
