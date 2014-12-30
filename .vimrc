""==============================================
" Description: vv1sp bundle .vimrc
" Author: Zolkin Yuriy <vv1sp@gmail.com>
" URL: https://github.com/vv1sp/dots
""===============================================

" Vundle configure and install plugins
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle, required
 Bundle 'gmarik/vundle'
" Project tree
 Bundle "scrooloose/nerdtree"
" Semantic autocomplete
" Bundle "Valloric/YouCompleteMe"
" Using structure project
 Bundle "majutsushi/tagbar"
" Snippets for C/C++ and many others lang
" Bundle "SirVer/ultisnips"
" Bundle "honza/vim-snippets"
" Airline
 Bundle 'bling/vim-airline'
" TODO, FIXME and XXX support
" Bundle "davidoc/taskpaper"
" colorscheme
Bundle 'nanotech/jellybeans.vim'
filetype plugin indent on

source ~/.vim/vimrc
source ~/.vim/Make.vim
source ~/.vim/codestyle.vim

""""""""""""
""NERDTree
""""""""""""
let g:NERDTreeQuitOnOpen=1

""""""""""""""""""""""""""""""""
""YCM - C/C++ clang completion""
""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_seed_identifiers_with_synatx = 1
let g:ycm_confirm_extra_conf = 1
let g:ycm_warning_symbol='*⇝'
let g:ycm_error_symbol='⇝'
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

"""""""""""
""airline 
"""""""""""
let g:airline_theme             = 'bubblegum'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1
let g:airline_detect_modified   = 1
let g:airline_exclude_preview   = 1

""""""""""""""""""""""""""
"" vim-powerline symbols""
""""""""""""""""""""""""""
let g:airline_left_sep          = ''
let g:airline_left_alt_sep      = ''
let g:airline_right_sep         = ''
let g:airline_right_alt_sep     = ''
let g:airline_branch_prefix     = ''
let g:airline_readonly_symbol   = ''
let g:airline_linecolumn_prefix = ''

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
" TEMPORALY DISABLED!!!!!!!!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.vim_runtime/my_configs.vim<cr>
autocmd! bufwritepost vimrc source ~/.vim_runtime/my_configs.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
    catch
endtry

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif
" Force 256 colors terminal 
set t_Co=256
" highlight cursor line
set cursorline
" Enable X11 clipboard
set clipboard=unnamedplus
"enable line numbers
set number
" Formating on aste
set paste
" Auto save files when focus is lost
au FocusLost * silent! wa
" disable compatible with vi
set nocompatible

" enhanced command-line completion
set wildmenu
" Ignore following files when completing file/directory names
" Version control
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
   set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
   set wildignore+=.git\*,.hg\*,.svn\*
endif
" always show status line
set laststatus=2

" current 
set ruler

" disable trash files
set nobackup
set noswapfile


" Кодировка файлов по умолчанию
set encoding=utf-8
" Возможные кодировки файлов, если файл не в unicode кодировке,
" то будет использоваться cp1251
set fileencodings=utf8,cp1251,

" interactive search
set hlsearch
set incsearch
set smartcase
set ignorecase

"colorscheme slate
try
   "colorscheme molokai
   colorscheme jellybeans
   catch echo "Colorschme don't installed"
endtry
" autoindent 
set autoindent
" Do smart indenting when starting a new line
" Only available when compiled with the +smartindent feature
set smartindent
autocmd BufEnter * silent! lcd %:p:h
" Always show tabs
set showtabline=2
" Display invisible characters
set list
if version >= 700
    set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
else
    set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
endif

"configure gtk gui
if has("gui_running")
    set guioptions-=T
    set guioptions-=m
    set guioptions-=e
    set guioptions-=r
    set guioptions-=L
endif
