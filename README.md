# mwiki
markdown wiki pulgin for vim 

record: [https://asciinema.org/a/dti9cfipk4lvdjxh8feeov860](https://asciinema.org/a/dti9cfipk4lvdjxh8feeov860)

## 配置
1. 依赖**tpope/vim-markdown**语法高亮插件 [https://github.com/tpope/vim-markdown](https://github.com/tpope/vim-markdown)
2. .vimrc 

``` viml
    let g:mwikis = [ {'path':'/home/h2ero/h2ero/wiki/vim/'}, {'path':'/home/h2ero/h2ero/jobwiki/'}]
```

## Feature

### 链接
1. <kbd>Leader</kbd>+<kbd>m</kbd>+<kbd>w</kbd>进入配置文件中第一个wiki首页. N+<kbd>Leader</kbd>+<kbd>m</kbd>+<kbd>w</kbd>进入配置文件中第N个wiki首页.
2. 光标下是文本, <kbd>Enter</kbd>创建链接，并创建文件
3. <kbd>Tab</kbd>跳转到下一个链接, <kbd>Shift</kbd>+<kbd>Tab</kbd>跳转到上一个链接
4. 光标下是链接， <kbd>Enter</kbd>进入链接指向的文件.
5. <kbd>Backspace</kbd> 返回上一次编辑的文件.

### Table
1. 创建Table, `Leader` + <kbd>m</kbd> +<kbd>t</kbd> + <kbd>c</kbd>
2. 编辑完成按ESC退回到Normal模式， Table会自动格式化
3. <kbd>Tab</kbd>跳转到下一个Cell, <kbd>Shift</kbd>+<kbd>Tab</kbd>跳转到上一个Cell

### HTML生成
* 目录和Github浏览文件一样, 见 [https://github.com/h2ero/mwiki/blob/master/doc/demowiki/index.md](https://github.com/h2ero/mwiki/blob/master/doc/demowiki/index.md) , 所以没有搞HTML生成的.

### 语法高亮

1. 支持markdown格式的语法高亮.

<img src="https://raw.githubusercontent.com/h2ero/mwiki/master/doc/images/highlight.png">

```  markdown
    # vimL
    
    ## Hello Word
    
    ``` viml
    " markdown highlight code block
    echo "Hello World"
    ```
```
