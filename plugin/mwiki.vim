autocmd FileType markdown noremap <buffer> <CR> <Esc>:call mwiki#ActionLink()<CR>
au BufRead,BufNewFile *.md :call mwiki#init()

