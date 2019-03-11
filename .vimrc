" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 定义快捷键的前缀，即<Leader>
let mapleader="\<Space>"

call plug#begin('~/.vim/load')
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-fswitch'
Plug 'majutsushi/tagbar'
Plug 'sjl/gundo.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeFind' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
call plug#end()
"
"Plug 'ludovicchabant/vim-gutentags'

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 定义快捷键到行首和行尾
"nmap LB 0
"nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
"vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
"nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %

" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
"vim自动跳转上次打开位置
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 配色方案
set t_Co=256 " required
"set background=light
"colorscheme solarized
colorscheme molokai
"colorscheme phd

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap
"显示字符
"set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
"set list
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set termencoding=utf-8
set encoding=utf-8
"设置backspace
set backspace=indent,eol,start
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
syntax keyword cppSTLtype initializer_list

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

"折叠
"set foldmethod=syntax
"set foldlevelstart=99

" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"nnoremap <leader>jc :YcmCompleter GoToDeclaration<CR>
"" 只能是 #include 或已打开的文件
"nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
"
"" 补全功能在注释中同样有效
"let g:ycm_complete_in_comments=1
"" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
"let g:ycm_confirm_extra_conf=0
"" 开启 YCM 标签补全引擎
"let g:ycm_collect_identifiers_from_tags_files=1
"" 引入 C++ 标准库tags
""set tags+=/data/misc/software/misc./vim/stdcpp.tags
"" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
""inoremap <leader>; <C-x><C-o>
"" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
"" 从第一个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=1
"" 禁止缓存匹配项，每次都重新生成匹配项
"let g:ycm_cache_omnifunc=0
"" 语法关键字补全
"let g:ycm_seed_identifiers_with_syntax=1

" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>e :NERDTreeFind<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinnnimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" :h g:incsearch#auto_nohlsearch
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

"AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"tagbar
nmap <leader>t :TagbarToggle<CR>

"gitgtter
"GitGutterAddLine          " default: links to DiffAdd
"GitGutterChangeLine       " default: links to DiffChange
"GitGutterDeleteLine       " default: links to DiffDelete
"GitGutterChangeDeleteLine " default: links to GitGutterChangeLineDefault, i.e. DiffChange

""fzf config
"" An action can be a reference to a function that processes selected lines
"    function! s:build_quickfix_list(lines)
"      call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
"      copen
"      cc
"    endfunction
"
""nmap <leader>p :Files<CR>
""nmap <leader>b :Buffers<CR>
"nmap <leader>g :GFiles<CR>
"let g:fzf_action = { 'ctrl-e': 'edit',
"      \ 'ctrl-q': function('s:build_quickfix_list'),
"      \ 'ctrl-t': 'tab split',
"      \ 'ctrl-x': 'split',
"      \ 'ctrl-v': 'vsplit' }
"
"let g:fzf_colors =
"    \ { 'fg':      ['fg', 'Normal'],
"      \ 'bg':      ['bg', 'Normal'],
"      \ 'hl':      ['fg', 'Comment'],
"      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"      \ 'hl+':     ['fg', 'Statement'],
"      \ 'info':    ['fg', 'PreProc'],
"      \ 'border':  ['fg', 'Ignore'],
"      \ 'prompt':  ['fg', 'Conditional'],
"      \ 'pointer': ['fg', 'Exception'],
"      \ 'marker':  ['fg', 'Keyword'],
"      \ 'spinner': ['fg', 'Label'],
"      \ 'header':  ['fg', 'Comment'] }
" "Command for git grep
" "- fzf#vim#grep(command, with_column, [options], [fullscreen])
"command! -bang -nargs=* GGrep
"  \ call fzf#vim#grep(
"  \   'git grep --line-number '.shellescape(<q-args>), 0,
"  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
"
" "Override Colors command. You can safely do this in your .vimrc as fzf.vim
" "will not override existing commands.
"command! -bang Colors
"  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
"command! -bang -nargs=* Ag
"  \ call fzf#vim#ag(<q-args>,
"  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \                 <bang>0)

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)
"
"" Likewise, Files command with preview window
"command! -bang -nargs=? -complete=dir Files
"  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"tags config
" gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.root', '.svn', '.git', '.project']
" 所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" 检测 ~/.cache/tags 不存在就新建 "
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" 配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

"leaderF config
noremap <leader>r :LeaderfFunction!<cr>
highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=21
highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201
let g:Lf_ShortcutF = '<C-P>'
noremap <leader>p :LeaderfFile<cr>
noremap <leader>b :LeaderfBuffer<cr>
let g:Lf_WorkingDirectoryMode = 'a'

" *.cpp 和 *.h 间切换
nmap <silent> <Leader>o :FSHere<cr>

nmap <Leader>f :Ag<cr>
let g:ag_highlight=1
