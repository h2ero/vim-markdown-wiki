"map 
autocmd FileType markdown,mkd noremap <silent> <buffer> <CR> <Esc>:call mwiki#link#Action()<CR>
au BufRead,BufNewFile *.md :call mwiki#init()
autocmd FileType markdown,mkd nmap <silent> <Tab> :call mwiki#common#GoToNext("")<CR>
autocmd FileType markdown,mkd nmap <silent> <S-Tab> :call mwiki#common#GoToNext("b")<CR>
autocmd FileType markdown,mkd inoremap <silent> <Esc>  <Esc>:call mwiki#table#CheckFormat()<CR>

autocmd FileType markdown,mkd nmap <silent> <BS> :call mwiki#link#GoToLast()<CR>

command! -count=1 MwikiGoToIndex  call mwiki#manage#GoToIndex(v:count1)
noremap <Leader>mw :MwikiGoToIndex<CR>

"test
noremap <Leader>mtc :call mwiki#table#Create(

