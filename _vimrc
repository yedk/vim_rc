" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Remap a few keys for Windows behavior
source $VIMRUNTIME/mswin.vim


"设置编码
set fileencoding=utf-8
set fileencodings=utf-8,chinese,gb2312
set encoding=utf-8
"解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"设置多标签显示
set showtabline=2
"在vivado中使用参数可以打开多标签页；
"C:\Program Files (x86)\Vim\vim82\gvim.exe --remote-tab-wait-silent  [file name]

"设置行号
set number

color obsidian

filetype on

set foldmethod=syntax

set guifont=Courier_new:h14:b:cDEFAULT

"用大写键代替esc键
:map！<CapsLock> <Esc>

"鼠标支持模式
set mouse=a
" Mouse behavior (the Windows way)
"Verilog的快捷语法 输入之后按tab键
"<cr>代表空格键
:ab always always@(posedge clk or negedge rst_n) begin<Enter>if(!rst_n)begin<Enter>end <Enter>else begin <Enter>end<Enter>end
:ab module module();<Enter><Enter>end

"Plug插件
call plug#begin('C:\Program Files (x86)\Vim\vim82\plugin')
Plug 'Valloric/YouCompleteMe'
call plug#end()

behave mswin

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

