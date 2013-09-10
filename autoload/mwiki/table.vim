"
" table  function 
"
" Last Change: 2013-09-10 10:46:11
"
" | Tables        | Are           | Cool  |
" | ------------- |:-------------:| -----:|
" | col 3 is      | right-aligned | $1600 |
" | col 2 is      | centered      |   $12 |
" | zebra stripes | are neat      |    $1 |

" check cursor string is a table
function! mwiki#table#Is(str)
    if a:str == ""
        let str = getline(".")
    else
        let str = a:str
    endif
    if match(str, '^|.*|$') != -1
        return 1
    endif
    return 0
endfunction


function! mwiki#table#CreateTable(row, col)
    let row = a:row - 1 
    let col = a:col - 2
    let table = ["|    |    |",
                \"| -- | -- |",
                \"|    |    |"]
    if row > 0 
        echo row
        for i in range(1,row,1)
            call   add(table, "|    |    |")
        endfor
    endif

    if col > 0 
        for i in range(1,len(table)-1,1)
            if i != 1
                let table[i] = table[i].repeat("    |", col)
            else
                let table[i] = table[i].repeat(" -- |", col)
            endif
        endfor
    endif

    call append(getpos(".")[1]-1,table)
endfunction

function! mwiki#table#CreateRow()
endfunction

function! mwiki#table#CreateRowHr()
endfunction
