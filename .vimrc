set nocompatible

"#######################################################

syntax enable
set number
set noruler
set ignorecase
set smartcase
set incsearch
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set confirm
set backspace=indent,eol,start
" indent  allow backspacing over autoindent
" eol     allow backspacing over line breaks (join lines)
" start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"        stop once at the start of insert.
set history=500
set showcmd
set showmode
set nowrap
set autowrite
set mouse="" " a(for all), i, v, c, n

set splitright
set clipboard=unnamed
"#######################################################

" Color
set laststatus=2
set t_Co=256
colorscheme torte
set cursorline
" set cursorcolumn
set hlsearch
hi CursorLine cterm=none ctermbg=238 ctermfg=none " none, underline, bold, reverse
hi CursorColumn cterm=none ctermbg=238 ctermfg=none
hi Search cterm=reverse ctermbg=none ctermfg=none

highlight ExtraWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.go match ExtraWhitespace /\s\+$/

"#######################################################

" encode
set encoding=utf-8
if has("multi_byte")
    set fileencodings=utf-8,utf-16,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1
else
    echoerr "If +multi_byte is not included, you should compile Vim with big features."
endif

nmap <C-b>n  :bnext<CR>
nmap <C-b>p  :bprev<CR>
"######################################################

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
" Plug 'SirVer/ultisnips'
Plug 'jiangmiao/auto-pairs'
" Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
call plug#end()

" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" nerdtree
map <F3> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" vim-gitgutter
set updatetime=100
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" vim-go
" autocomplete prompt to appear automatically whenever you press the dot (.)
" au filetype go inoremap <buffer> . .<C-x><C-o>
let g:go_auto_type_info = 1
" change gofmt to goimports
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
"
" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
" tagbar
nmap <F8> :TagbarToggle<CR>
let g:Tlist_Ctags_Cmd='/opt/homebrew/Cellar/ctags/5.8_2/bin/ctags'
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
