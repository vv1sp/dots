""=============================================================================
" Description: vv1sp bundle .vimrc
" Author: Zolkin Yuri <vv1sp@gmail.com>
" URL: https://github.com/vv1sp/dots
"=============================================================================
"For vunde
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle, required
 Bundle 'gmarik/vundle'
" Project tree
 Bundle "scrooloose/nerdtree"
" Semantic autocomplete 
 Bundle "Valloric/YouCompleteMe"
" Using structure project 
 Bundle "majutsushi/tagbar"
" Snippets for C/C++ and many others lang 
 Bundle "SirVer/ultisnips"
 Bundle "honza/vim-snippets"
" Airline
 Bundle 'bling/vim-airline'
" code space managment 
 Bundle "szw/vim-ctrlspace"
" TODO, FIXME and XXX support
 Bundle "davidoc/taskpaper"
" For vundle
filetype plugin indent on

""""""""""""
""NERDTree""
""""""""""""
let g:NERDTreeQuitOnOpen=1

""""""""""""""""""""""""
"" ctr-space configure""
""""""""""""""""""""""""
hi CtrlSpaceSelected term=reverse ctermfg=187   guifg=#d7d7af ctermbg=23    guibg=#005f5f cterm=bold gui=bold
hi CtrlSpaceNormal   term=NONE    ctermfg=244   guifg=#808080 ctermbg=232   guibg=#080808 cterm=NONE gui=NONE
hi CtrlSpaceSearch   ctermfg=220  guifg=#ffd700 ctermbg=NONE  guibg=NONE    cterm=bold    gui=bold
hi CtrlSpaceStatus   ctermfg=230  guifg=#ffffd7 ctermbg=234   guibg=#1c1c1c cterm=NONE    gui=NONE
let g:ctrlspace_use_mouse_and_arrow=1

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
""airline"" 
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

""""""""""""""""""""""""
""YCM + UltiSnips = <3""
""""""""""""""""""""""""
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

""""""""""""""""""""""
""Custom font config""
""""""""""""""""""""""
if has("gui_running")
   if has("gui_gtk2")
        let dsm=system('fc-list | grep -c Droid\ Sans\ Mono')
        let cons=system('fc-list | grep -c Inconsola')
        if ( dsm > 0)
           set gfn=Droid\ Sans\ Mono\ for\ Powerline\ 10
        elseif ( cons > 0)
           set gfn=Droid\ Sans\ Mono\ for\ Powerline\ 10
        else 
           set gfn=Droid\ Sans\ Mono\ for\ Powerline\ 10
        endif
   elseif has("gui_win32")
      set guifont=Droid\ Sans\ Mono:h10,Consolas:h11:cANSI
   endif
endif

source ~/.vim/vimrc
source ~/.vim/Make.vim

" Enable mouse
set mouse=a
" Force 256 colors terminal 
set t_Co=256
" highlight cursor line
set cursorline
" Enable X11 clipboard
set clipboard=unnamedplus
" Formating on paste
set paste
" Auto save files when focus is lost
au FocusLost * silent! wa
" disable compatible with vi
set nocompatible   
" enhanced command-line completion
set wildmenu    
" Ignore following files when completing file/directory names
" Version control
set wildignore+=.hg,.git,.svn
" always show status line
set laststatus=2    
set ruler
" enable line numbers
set number
" disable trash files
set nobackup
set noswapfile
" Кодировка файлов по умолчанию
set encoding=utf-8
" Возможные кодировки файлов, если файл не в unicode кодировке,
" то будет использоваться cp1251
set fileencodings=utf8,cp1251,
" online serch 
set hlsearch
set incsearch
"colorscheme slate
colorscheme molokai 
" swap tabs on space
" size of a hard tabstop
set tabstop=3
" size of an "indent"
set shiftwidth=3
" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=3
"make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
" always uses spaces instead of tab characters
set expandtab
" autoindent 
set autoindent
" Do smart indenting when starting a new line
" Only available when compiled with the +smartindent feature
set smartindent
autocmd BufEnter * silent! lcd %:p:h
" Always show tabs
" set showtabline=2
" Display invisible characters
set list
if version >= 700
    set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
else
    set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
endif
" hide toolbar
set guioptions-=T 
set guioptions-=m
set guioptions-=e
set guioptions-=r 
set guioptions-=L
