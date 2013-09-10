"map 
autocmd FileType markdown noremap <buffer> <CR> <Esc>:call mwiki#link#Action()<CR>
au BufRead,BufNewFile *.md :call mwiki#init()
autocmd FileType markdown nmap <Tab> :call mwiki#common#GoToNext("")<CR>
autocmd FileType markdown nmap <S-Tab> :call mwiki#common#GoToNext("b")<CR>
autocmd FileType markdown inoremap <Esc>  <Esc>:call mwiki#table#CheckFormat()<CR>
