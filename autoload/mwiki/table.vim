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


function! mwiki#table#Create(row, col)
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
        for i in range(0,len(table)-1,1)
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

function! mwiki#table#CheckFormat()
        if mwiki#table#Is("") 
            call mwiki#table#Format()
        else
            normal! "<Esc>"
        endif
endfunction

function! mwiki#table#Format()

    " Step 1. get table line range
    " Step 2. read table cell in to tow dimensional array
    " Step 3. calculate cell max with and fill other cell which with less than max width
    
    let nowLine = getpos(".")[1]
    let endLine = nowLine
    let firstLine = nowLine

    while match(getline(nowLine), '^|.*|$')  != -1
        let firstLine = nowLine
        let nowLine  = nowLine - 1
    endwhile

    let nowLine = endLine
    while match(getline(nowLine), '^|.*|$')  != -1
        let endLine = nowLine
        let nowLine  = nowLine + 1
    endwhile

    let table = []
    for lineNum in range(firstLine, endLine, 1)
        let table = add(table, split(getline(lineNum), "|"))
    endfor

    let colLen = []
    for i in range(0,len(table[0])-1)
        call add(colLen, 0)
    endfor

    " fliter begin and end space  of cell
    for i in range(0, len(table)-1, 1)
        for ii in range(0,len(table[i])-1, 1)
            let table[i][ii] = substitute(table[i][ii], '^\s\+\(\S*\)\s\+$', '\1', 'g')
            if len(table[i][ii]) > colLen[ii] && i != 1
                let colLen[ii] = len(table[i][ii])
            endif
        endfor
    endfor

    " add space in cell
    for i in range(0, len(table)-1, 1)
        for ii in range(0,len(table[i])-1, 1)
            let halfWidth =  (colLen[ii]-len(table[i][ii])) / 2.0
            let rightWidth = float2nr(round(halfWidth))
            let leftWidth = float2nr(floor(halfWidth))
            if i == 1
                let table[i][ii] = " ".repeat("-",colLen[ii])." "
            else
                let table[i][ii] = repeat(" ", leftWidth+1).table[i][ii].repeat(" ", rightWidth+1)
            endif
        endfor
        let table[i] = join(table[i],"|")
    endfor

    for i in range(0, len(table)-1)
        let table[i] = "|".table[i]."|"
    endfor

    call setline(firstLine, table)
endfunction
