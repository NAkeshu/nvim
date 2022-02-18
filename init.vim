" Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" =========================================================
" =========================================================
" ===   以下是自定义内容 <> Customized Contents Below   ===
" =========================================================

" 基础设置 <> Basic Setting
let skip_defaults_vim=1

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

syntax on " 语法高亮
set encoding=utf-8

set number " 显示行号
set wrap " 自动折行
set relativenumber " 显示光标所在的当前行的行号
                   " 其他行都为相对于该行的相对行号
set cursorline " 突出当前行
" set cursorcolumn " 突出当前列
set showmatch " 高亮匹配括号

" set mouse=a " 支持使用鼠标

set shiftwidth=4 " 默认缩进4空格
set expandtab " 空格代替tab
set softtabstop=2 " 使用tab时空格数
set tabstop=2 " tab代表2空格
set autoindent " 自动缩进
set list " 显示末尾的tab和空格
set listchars=tab::▸\ ,trail:▫

set scrolloff=5
set tw=0
set foldmethod=indent " 代码折叠
set nofoldenable

set hlsearch " 高亮搜索结果
exec "nohlsearch"
set incsearch " 搜索同时高亮
set ignorecase " 忽略大小写
set smartcase " 智能大小写

" 自定义按键 <> Customized Keys
let mapleader=" " " 设置空格键为LEADER键

map Q :q<CR>
map W :w<CR>

map <CR>d :set splitright<CR>:vsplit<CR>
map <CR>a :set nosplitright<CR>:vsplit<CR>
map <CR>s :set splitbelow<CR>:split<CR>
map <CR>w :set nosplitbelow<CR>:split<CR>
map <LEADER>l <C-w>l
map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

map <TAB><TAB> :tabe<CR>
map <TAB>j :-tabnext<CR>
map <TAB>k :+tabnext<CR>

map <C-j> 5j
map <C-k> 5k
map <LEADER><CR> :nohlsearch<CR>

" 插件快捷键
" nmap tt :NERDTreeFocus<CR>
" nmap <LEADER>n :NERDTree<CR>
" nmap <LEADER>t :NERDTreeToggle<CR>
" nmap <LEADER>f :NERDTreeFind<CR>
nmap tt :NERDTreeToggle<CR>
nmap tb :TagbarToggle<CR>
nmap <LEADER>u :UndotreeToggle<CR>
nmap <C-m>p :MarkdownPreview<CR>
" nmap <C-m>s :MarkdownPreviewStop<CR>
nmap <C-m>t :TableModeToggle<CR>

" 插件设置 <> Plugins Setting
" vim-plug
call plug#begin('~/.config/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'mhartington/oceanic-next'

" NerdTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" TagBar
Plug 'preservim/tagbar'

Plug 'mbbill/undotree'
Plug 'itchyny/vim-cursorword'
Plug 'Yggdroot/indentLine'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" snippets
Plug 'honza/vim-snippets'

call plug#end()

" Theme
syntax enable

" OceanicNext
if (has("termguicolors"))
 set termguicolors
endif
colorscheme OceanicNext
let g:airline_theme='oceanicnext'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
" For Transparancy
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE

" snazzy
" colorscheme snazzy
" let g:SnazzyTransparent = 1

" TagBar设置
let g:Tlist_Ctags_Cmd='/opt/homebrew/bin/ctags'

" NerdTree-git
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:indentLine_setColors = 0

" Markdown
" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

" ===
" ===coc.nvim config
" ===
" extensions list
let g:coc_global_extensions = [
            \ "coc-marketplace",
            \ "coc-json",
            \ "coc-vimlsp",
            \ "coc-python",
            \ "coc-rls",
            \ "coc-rust-analyzer",
            \ "coc-snippets",
            \ ]

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use <LEADER>? to show documentation in preview window.
nnoremap <silent> <LEADER>? :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
imap <C-p> <Plug>(coc-snippets-expand)
vmap <C-f> <Plug>(coc-snippets-select)
imap <C-f> <Plug>(coc-snippets-expand-jump)

