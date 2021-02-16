# vim markdown wiki
markdown wiki pulgin for vim 

this plug has  a lot of functions are referenced from  [vimwiki](https://github.com/vimwiki/vimwiki).

record: [https://asciinema.org/a/dti9cfipk4lvdjxh8feeov860](https://asciinema.org/a/dti9cfipk4lvdjxh8feeov860)

## Install
### .vimrc 
``` viml
    Plug 'tpope/vim-markdown'
    Plug 'h2ero/vim-markdown-wiki'
    let g:mwikiTableAlign = "left"
    let g:mwikis = [ {'path':$HOME.'/wiki1/'}, {'path':$HOME.'/wiki2/'} ]
```

## Feature

### Link
1. <kbd>Leader</kbd>+<kbd>m</kbd>+<kbd>w</kbd> will open wiki1 index.md in your config. 2+<kbd>Leader</kbd>+<kbd>m</kbd>+<kbd>w</kbd> will open wiki1 index.md in your config.
2. cursor is under the text, press <kbd>Enter</kbd> will create markdown link and open link file，
3. cursor is under the link, <kbd>Tab</kbd> jump to next link, <kbd>Shift</kbd>+<kbd>Tab</kbd> jump to the previous.
4. cursor is under the link， <kbd>Enter</kbd> will goto link file.
5. <kbd>Backspace</kbd> go back previous file.

### Table
1. create table, `Leader` + <kbd>m</kbd> +<kbd>t</kbd> + <kbd>c</kbd>
2. press ESC normal mode form insert mode， Table will be align.
3. <kbd>Tab</kbd> jump to next table cell, <kbd>Shift</kbd>+<kbd>Tab</kbd> jump to previous cell

### export html
* the category like Github browser file , example [https://github.com/h2ero/mwiki/blob/master/doc/demowiki/index.md](https://github.com/h2ero/mwiki/blob/master/doc/demowiki/index.md), you can read it quickly on github or other git host website.

### syntax highlighting 

1. markdown style syntax highlighting

<img src="https://raw.githubusercontent.com/h2ero/mwiki/master/doc/images/highlight.png">

```  markdown
    # vimL
    
    ## Hello Word
    
    ``` viml
    " markdown highlight code block
    echo "Hello World"
    ```
```

### my wiki screenshot
<img src="https://raw.githubusercontent.com/h2ero/mwiki/master/doc/images/index.png">
