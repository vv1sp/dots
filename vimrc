""==============================================
" Description: vv1sp bundle .vimrc
" Author: Zolkin Yuriy <vv1sp@gmail.com>
""===============================================

" Specify a directory for plugins 
" - For Neovim: ~/.local/share/nvim/plugged 
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'tomasr/molokai'
" Initialize plugin system 
call plug#end()

" => Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
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
" always show status line
set laststatus=2

" current 
set ruler

" disable trash files
set nobackup
set noswapfile

" default encoding 
set encoding=utf-8
set fileencodings=utf8,cp1251,

" interactive search
set hlsearch
set incsearch
set smartcase
set ignorecase

"colorscheme slate
try
   colorscheme molokai
"   colorscheme jellybeans
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

set laststatus=2
