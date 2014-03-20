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

    " find first line no
    while match(getline(nowLine), '^|.*|$')  != -1
        let firstLine = nowLine
        let nowLine  = nowLine - 1
    endwhile

    " find end line no
    let nowLine = endLine
    while match(getline(nowLine), '^|.*|$')  != -1
        let endLine = nowLine
        let nowLine  = nowLine + 1
    endwhile

    " get table cell
    let table = []
    for lineNum in range(firstLine, endLine, 1)
        let table = add(table, split(getline(lineNum), "|"))
    endfor

    " init colLen for each cell
    let colLen = []
    for i in range(0,len(table[0])-1)
        call add(colLen, 0)
    endfor

    " fliter begin and end space  of cell, and get col cell max width
    for i in range(0, len(table)-1, 1)
        for ii in range(0,len(table[i])-1, 1)
            let table[i][ii] = mwiki#function#trim(table[i][ii])
            " exclude ---- line 1
            if strdisplaywidth(table[i][ii]) > colLen[ii] && i != 1
                " cell max width
                let colLen[ii] = strdisplaywidth(table[i][ii])+1
            endif
        endfor
    endfor

    " add space in cell
    for i in range(0, len(table)-1, 1)
        for ii in range(0,len(table[i])-1, 1)
            let fullWidth = colLen[ii]-strdisplaywidth(table[i][ii])
            let halfWidth =  fullWidth / 2.0
            let rightWidth = float2nr(round(halfWidth))
            let leftWidth = float2nr(floor(halfWidth))
            if i == 1
                let table[i][ii] = " ".repeat("-",colLen[ii])." "
            else
                if g:mwikiTableAlign == "center"
                    let table[i][ii] = repeat(" ", leftWidth+1).table[i][ii].repeat(" ", rightWidth+1)
                elseif g:mwikiTableAlign == "left"
                    let table[i][ii] = repeat(" ", 2).table[i][ii].repeat(" ", fullWidth)
                else
                    let table[i][ii] = repeat(" ", 2).table[i][ii].repeat(" ", fullWidth)
                endif
            endif
        endfor
        let table[i] = join(table[i],"|")
    endfor

    for i in range(0, len(table)-1)
        let table[i] = "|".table[i]."|"
    endfor

    call setline(firstLine, table)
endfunction
