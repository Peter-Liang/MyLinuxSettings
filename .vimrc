set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-airline/vim-airline'

" JavaScript related
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'

Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'mattn/emmet-vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"************ Common settings begin ************
color hybrid_reverse
syntax on
set hlsearch
set noswapfile
nnoremap / /\v
vnoremap / /\v
inoremap jk <ESC>
"inoremap <ESC> <nop>
nnoremap <leader><space> :noh<cr>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>r yiw :%s/<c-r>"//gc<left><left><left>
nnoremap <F2> :ls<cr>:b
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-cr> <esc>o

" JavaScript Related keymap
autocmd FileType javascript inoremap <buffer> <c-s-cr> <esc>A;<cr>
autocmd FileType javascript inoremap <buffer> ;; <ESC>A;<ESC>
autocmd FileType javascript noremap <buffer> <F5> :w<cr> :!node % <cr>

set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set nu
set undofile
set undodir=$TMPDIR
set undolevels=1000
set undoreload=10000
set nowrap
"************ Common settings end ************

"************ GUI settings begin ************
hi LineNr guifg=DarkRed
hi LineNr ctermfg=DarkRed
set guifont=PT_Mono:h18
"************ GUI settings end ************

"************ Caplock settings begin ************
" Execute 'lnoremap x X' and 'lnoremap X x' for each letter a-z.
for c in range(char2nr('A'), char2nr('Z'))
  execute 'lnoremap ' . nr2char(c+32) . ' ' . nr2char(c)
  execute 'lnoremap ' . nr2char(c) . ' ' . nr2char(c+32)
endfor

" Kill the capslock when leaving insert mode.
autocmd InsertLeave * set iminsert=0
"************ Caplock settings end ************

" JsBeautify options

map <bs> :call JsBeautify()<cr>
augroup JsBeautify
    " or
    autocmd FileType javascript noremap <buffer>  <bs> :call JsBeautify()<cr>
    " for json 
    autocmd FileType json noremap <buffer> <bs> :call JsonBeautify()<cr>
    " for jsx 
    autocmd FileType jsx noremap <buffer> <bs> :call JsxBeautify()<cr>
    " for html
    autocmd FileType html noremap <buffer> <bs> :call HtmlBeautify()<cr>
    " for css or scss
    autocmd FileType css noremap <buffer> <bs> :call CSSBeautify()<cr>
    autocmd FileType python noremap <buffer> <bs> :Autoformat<cr>
augroup END

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" ultisnips configuration
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-]>
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-z>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" YouCompleteMe options
let g:ycm_key_list_select_completion = ['<Enter>', '<Down>']
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" nerdtree configuration
noremap <leader>\ :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=1
let NERDTreeShowLineNumbers = 1



" vim-repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

" command-t
let g:CommandTWildIgnore=&wildignore . ",**/bower_components/*,**/node_modules/*,**/__pycache__/*"

" NerdCommenter Settings
nmap <space> <plug>NERDCommenterToggle
