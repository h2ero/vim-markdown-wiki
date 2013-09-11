"
" common  function 
"
function! mwiki#manage#GoToIndex(index)
    " echo mwikis - 1
    execute "edit ".g:mwikis[a:index-1]['path']."index.md"
endfunction
