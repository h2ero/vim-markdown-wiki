"
" link function 
"
" Last Change: 2013-09-10 10:50:44

function! mwiki#link#Action()
    let g:cursorStr = mwiki#function#GetCursorString("true")
    if mwiki#link#Is(g:cursorStr) == 1
        let path = mwiki#link#GetLocation(g:cursorStr)
        if match(path,'md$') != -1
            call mwiki#link#Enter(path)
        else
            echo "this link not end with .md"
        endif
    else
        let link = mwiki#link#Create(g:cursorStr)
        call mwiki#common#ReplaceCursorStr(link)
    endif
endfunction

" check cursor string is a link
function! mwiki#link#Is(str)
    if a:str == ""
        let str = expand("<cWORD>")
    else
        let str = a:str
    endif
    if match(str, '\[.*\](.*)') != -1
        return 1
    endif
    return 0
endfunction

" create link
function! mwiki#link#Create(word)
    let linkName = a:word
    if match(a:word,'/') != -1
        let linkName = matchlist(a:word, '/\([^/]*\)$')[1]
        let path = substitute(a:word,'/[^/]\+$', "", "s")
        call mwiki#common#CreateDir(path)
    endif
    let link = "[".linkName."](".a:word.".md)"
    return link
endfunction

" jump link locate file
function! mwiki#link#Enter(path)
    execute "edit ".escape(a:path, " ")
endfunction

" get link location
function! mwiki#link#GetLocation(link)
    return matchlist(a:link, '(\(.*\))')[1]
endfunction
