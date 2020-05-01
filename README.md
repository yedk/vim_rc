# vim_rc
vim的配置文件
## 主题
使用obsidian主题，主题链接为git@github.com:abra/vim-obsidian.git

## 插件管理器 vim-plug

git@github.com:junegunn/vim-plug.git

使用vim-plug安装vim插件的方法只需要在vim配置文件 `~/.vimrc` 增加以 `call plug#begin(PLUGIN_DIRECTORY)` 开始，并以 `plug#end()` 结束的配置段即可。

下面是一个典型的vim-plug的配置实例，使用了多种vim-plug相关的配置形式。

```
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'Plug 'SirVer/ultisnips' | 
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/my-prototype-plugin'
call plug#end()
```

在上面的vim-plug配置中，以 `call plug#begin('~/.vim/plugged')` 标识vim-plug配置的开始并显式指定vim插件的存放路径为 *~/.vim/plugged*；

`Plug 'junegunn/vim-easy-align'` 使用缩写形式指定了插件在github的地址 ([https://github.com/junegunn/vim-easy-align](https://vimjc.com/[https://github.com/junegunn/vim-easy-align))；

`Plug 'https://github.com/junegunn/vim-github-dashboard.git'` 则用完整的URL指定插件在github的位置；

`Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'` 用 | 将两个vim插件写在同一行配置中；

`Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }` 使用 **按需加载**，表明只有在 `NERDTreeToggle` 命令被调用时, 对应的插件才会被加载；

`Plug 'tpope/vim-fireplace', { 'for': 'clojure' }` 使用 **按需加载**，表明只有编辑 *clojure* 类型的文件时该插件才会被打开；

`Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }` 显式指定使用YCM-Generator插件的 *stable* 分支；

`Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }` 指定插件所用git标签，rtp描述了包含vim插件的子目录；

`Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }` 用 **dir** 选项单独指定了该插件存放的目录，**do**选项用于 Post-update hook，指定在安装或者更新完插件后所需要执行的额外操作；

`Plug '~/my-prototype-plugin'` 表示不用github托管的本地vim插件；

`call plug#end()` 用于标识vim-plug配置的结束。

------

总结上面的vim-plug配置，可以发现vim-plug支持以下配置项：

| 选项                    | 功能描述                                                     |
| :---------------------- | :----------------------------------------------------------- |
| `branch`/`tag`/`commit` | 所用插件git仓库的Branch/tag/commit                           |
| `rtp`                   | 包含vim插件的子目录                                          |
| `dir`                   | 该vim插件的定制化目录 (Custom directory)                     |
| `as`                    | 给vim插件取别名                                              |
| `do`                    | Post-update hook，某些vim插件在完成安装或更新后，需要执行额外的操作，可以使用 do 选项指定具体的操作或函数 |
| `on`                    | 按需加载: vim命令或``-mappings                               |
| `for`                   | 按需加载: 文件类型                                           |
| `frozen`                | Do not update unless explicitly specified                    |

**注**：`do` 选项的操作如果是以 `:` 开头，则表示其为vim命令，例如: `Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }`



