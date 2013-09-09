"
" vim markdown wiki plugin
"
"
" Author: h2ero <122750707@qq.com>
" Start Date: 2013-09-09 11:27:11
" Last Change: 2013-09-09 11:27:15
" Version: 0.0.1
" License: MIT license <http://www.opensource.org/licenses/mit-license>

if exists("g:loaded_mwiki") || &cp
    finish
endif

function! mwiki#init()
    call mwiki#hightlight#init()
endfunction

function! mwiki#ActionLink()
    let g:cursorStr = expand("<cWORD>")
    if mwiki#IsLink(g:cursorStr) == 1
        let path = mwiki#GetLinkLocation(g:cursorStr)
        call mwiki#EnterLink(path)
    else
        let link = mwiki#CreateLink(g:cursorStr)
        call mwiki#ReplaceCursorStr(link)
    endif
endfunction

" check cursor string is a link
function! mwiki#IsLink(str)
    if match(a:str, '\[.*\](.*)') != -1
        return 1
    endif
    return 0
endfunction

" create link
function! mwiki#CreateLink(word)
    let linkName = a:word
    if match(a:word,'/') != -1
        let linkName = matchlist(a:word, '/\([^/]*\)$')[1]
        let path = substitute(a:word,'/[^/]\+$', "", "s")
        call mwiki#CreateDir(path)
    endif
    let link = "[".linkName."](".a:word.".md)"
    return link
endfunction

" jump link locate file
function! mwiki#EnterLink(path)
    execute "edit ".a:path
endfunction

function! mwiki#GetLinkLocation(link)
    return matchlist(a:link, '(\(.*\))')[1]
endfunction

function! mwiki#ReplaceCursorStr(replaceString)
    let replaceString = escape(a:replaceString,']\/*')
    exec 's/\S*\%#\S*/'.replaceString
endfunction

function! mwiki#CreateDir(path)
    call mkdir(a:path, "p", 0755)
endfunction
