" pathogen
let g:pathogen_disabled = [ 'pathogen' ] " don't load self
call pathogen#infect() "load everthing else
call pathogen#helptags() "load plugin help files

" common setting
set history=50
set ruler
set showcmd
set incsearch
set nu

" set mapleader
let mapleader = ","
" when .vimr is endited, reload it 
autocmd! bufwritepost .vimrc source ~/.vimrc

" gui options
set guioptions-=T

" tab stop
set tabstop=4
set sts=4
set shiftwidth=4
set expandtab
set autoindent

" syntax highlighting
syntax on
filetype on
filetype plugin indent on

" colorscheme
colorscheme desert

" fonts
set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"set gfw=wqy-zenhei
set gfw=AR\ PL\ UMing\ 12

" for cscope
" 加载当前目录的cscope.out
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

" 查找C语言符号，查找函数名，宏出现的地方
nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <F7> :cs find s 
" 查找函数定义的地方
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
" 查找调用本函数函数
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
" 查找指定的字符串
nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
" 查找egrep
nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
" 查找并打开文件，类似vim的find
nmap <leader>cf :cs find f <C-R>=expand("<cword>")<CR><CR>
" 查找包含文本
nmap <leader>ci :cs find i <C-R>=expand("<cword>")<CR><CR>
" 查找本函数调用的函数
nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

" flod method
set foldmethod=indent
set foldlevel=99

"tasklist
map <leader>td <Plug>TaskList

" gundo
map <leader>g :GundoToggle<CR>

"pyflake
let g:pyflakes_use_quickfix = 0

" Pep8
let g:pep8_map='<leader>8'

" complete
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

set completeopt=menuone,longest,preview

"NERD
map <leader>n :NERDTreeToggle<CR>

" Rope
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"ack
nmap <leader>a <Esc>:Ack!

" current tags
nmap <leader>cg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .

" tags
set tags+=~/.vim/tags/include_tags

" miniBufExplorer++
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapTabSwitchBufs = 1
""let g:miniBufExplModSelTarget = 1

" Tlist setting
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Ctags_Cmd='/usr/bin/ctags'

" winManager setting
let g:winManagerWindowLayout='BufExplorer,FileExplorer|TagList'
nmap <leader>wm :WMToggle<cr>

" run python file
map <leader>py :!python %<CR>

" rfc syntax files
function! Rfcsyntax ()
    if expand('%:t')=~?'rfc\d\+'
        setfiletype rfc
    endif
endfunction
autocmd! BufReadPost rfc\d\+.txt setfiletype rfc
