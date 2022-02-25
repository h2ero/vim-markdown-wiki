"
" common  function 
"
function! mwiki#manage#GoToIndex(index)
    " echo mwikis - 1
    call mwiki#link#Enter(g:mwikis[a:index-1]['path']."index.md")
    :lcd %:p:h "set windows current working directory to wiki - so that files save correctly if opening from outside the wiki folder
endfunction
