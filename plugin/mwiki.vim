"map 
autocmd FileType markdown noremap <silent> <buffer> <CR> <Esc>:call mwiki#link#Action()<CR>
au BufRead,BufNewFile *.md :call mwiki#init()
autocmd FileType markdown nmap <silent> <Tab> :call mwiki#common#GoToNext("")<CR>
autocmd FileType markdown nmap <silent> <S-Tab> :call mwiki#common#GoToNext("b")<CR>
autocmd FileType markdown inoremap <silent> <Esc>  <Esc>:call mwiki#table#CheckFormat()<CR>

command! -count=1 MwikiGoToIndex  call mwiki#manage#GoToIndex(v:count1)
noremap <Leader>mw :MwikiGoToIndex<CR>

"test
noremap <Leader>mtc :call mwiki#table#Create(

