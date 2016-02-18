# mwiki
markdown wiki for vim 


## 配置
1. .vimrc 
    let g:mwikis = [ {'path':'/home/h2ero/h2ero/wiki/vim/'}, {'path':'/home/h2ero/h2ero/jobwiki/'}]

## Feature

### 链接
1. <kbd>Leader</kbd>+<kbd>m</kbd>+<kbd>w</kbd>进入wiki首页.
2. 光标下是文本, <kbd>Enter</kbd>创建链接，并创建文件
3. <kbd>Tab</kbd>主动跳转到下一个链接, <kbd>Shift</kbd>+<kbd>Tab</kbd>跳转到上一个链接
4. 光标下是链接， <kbd>Enter</kbd>进入链接指向的文件.
5. <kbd>Backspace</kbd> 返回上一次编辑的文件.

### Table
1. 创建Table
2. Table自动格式化

### 语法高亮
1. 支持markdown格式的语法高亮.
``` viml
    ``` viml
    set nu
    ```
```
