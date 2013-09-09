autocmd FileType markdown noremap <buffer> <CR> <Esc>:call mwiki#ActionLink()<CR>
au BufRead,BufNewFile *.md :call mwiki#init()
autocmd FileType markdown nmap <Tab> :call mwiki#GoToNext("")<CR>
autocmd FileType markdown nmap <S-Tab> :call mwiki#GoToNext("b")<CR>
