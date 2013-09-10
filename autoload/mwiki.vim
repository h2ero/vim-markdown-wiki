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
    call mwiki#highlight#init()
endfunction
