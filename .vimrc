""""""""""""""
" keymaps
""""""""""""""
 nnoremap <silent> <F2> :NERDTreeFocus <CR>
 nnoremap <silent> <F3> :TagbarOpenAutoClose<CR>
 nnoremap <silent> <F6> :Make <CR>
 map <F4> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
""""""""""""" 
" keymaps 
"""""""""""""
"""""""""""""""""""""""
" UltiSnips + YCM = <3
"""""""""""""""""""""""
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
let g:UltiSnipsSnippetsDir="~/.vim/bundle/vim-snippets/snippets"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"""""""""""""""""""""""""
" UltiSnips + YCM = <3
"""""""""""""""""""""""""

""""""""""""""""""""""
" Make script
""""""""""""""""""""""
 fun! SetMkfile()
   let filemk = "Makefile"
   let dirmk  = "build/"
   let pathmk = "./"
   let depth  = 1
   while depth < 4
     if filereadable(pathmk . dirmk . filemk)
        let pathmk = pathmk . dirmk 
        echo pathmk
        return pathmk
     endif
     if filereadable(pathmk . filemk)
       return pathmk
     endif
     let depth += 1
     let pathmk = "../" . pathmk
   endwhile
   return "."
 endf
 command! -nargs=* Make tabnew | let $mkpath = SetMkfile() | make <args> -C $mkpath | cwindow 10
""""""""""""""""""""""
" Make script
""""""""""""""""""""""
 set mouse=a
 set t_Co=256
 set clipboard=unnamedplus
 set paste

" http://vim.wikia.com/wiki/Auto_save_files_when_focus_is_lost
 au FocusLost * silent! wa
" disable compatible with vi
 set nocompatible   
" enhanced command-line completion
 set wildmenu    
" always show status line
 set laststatus=2    
 set ruler
" enable line numbers
 set number
" disable trash files
 set nobackup
 set noswapfile
 set encoding=utf-8 " Кодировка файлов по умолчанию
 set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
 " то будет использоваться cp1251
 set hlsearch
 set incsearch

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
 let g:airline_theme             = 'powerlineish'
 let g:airline_enable_branch     = 1
 let g:airline_enable_syntastic  = 1
 let g:airline_detect_modified   = 1

 " vim-powerline symbols
 let g:airline_left_sep          = '⮀'
 let g:airline_left_alt_sep      = '⮁'
 let g:airline_right_sep         = '⮂'
 let g:airline_right_alt_sep     = '⮃'
 let g:airline_branch_prefix     = '⭠'
 let g:airline_readonly_symbol   = '⭤'
 let g:airline_linecolumn_prefix = '⭡'
 """""""""""""""""""""
 " airline end 
 """""""""""""""""""""

"colorscheme slate
colorscheme xoria256

 let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
 let g:ycm_collect_identifiers_from_tags_files = 1
 let g:ycm_autoclose_preview_window_after_completion=1
 let g:ycm_collect_identifiers_from_tags_files=1
 let g:ycm_register_as_syntastic_checker = 1 
 let g:ycm_seed_identifiers_with_synatx = 1
 let g:ycm_confirm_extra_conf = 1
 let g:ycm_use_ultisnips_completer = 1

" swap tabs on space
"size of a hard tabstop
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

 filetype off  "обязательно!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()
 filetype plugin indent on     " обязательно!

"репозитории на github
" let Vundle manage Vundle, required
 Bundle 'gmarik/vundle'
"дерево проекта
 Bundle "https://github.com/scrooloose/nerdtree"
"clang  автокомплит
 Bundle "https://github.com/Valloric/YouCompleteMe.git"
" code navigation  
 Bundle "kokx/exuberant-ctags" 
" monokai colorscheme
 Bundle "vim-scripts/xoria256.vim"
 Bundle "https://github.com/tomasr/molokai.git"
 Bundle "https://github.com/baskerville/bubblegum.git"
" CMake
 Bundle "https://github.com/vhdirk/vim-cmake.git"
" tagbar
 Bundle "majutsushi/tagbar"
" UltiSnips
 Bundle "SirVer/ultisnips"
" Snippets are separated from the engine. Add this if you want them:
 Plugin 'honza/vim-snippets'
" Airline
 Bundle 'bling/vim-airline'
" gdb integration
" Bundle "xieyu/pyclewn"
" multiple cursor
 Bundle 'terryma/vim-multiple-cursors'
