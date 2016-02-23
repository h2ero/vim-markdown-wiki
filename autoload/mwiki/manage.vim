"
" common  function 
"
function! mwiki#manage#GoToIndex(index)
    " echo mwikis - 1
    call mwiki#link#Enter(g:mwikis[a:index-1]['path']."index.md")
endfunction
