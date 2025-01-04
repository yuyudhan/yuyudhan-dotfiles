" vim/yuyudhan/config.vim

" ************************************************************
" Set the CursorHoldI timeout
set updatetime=1500  " Time in milliseconds 

" Auto switch to normal mode after n seconds of inactivity in insert mode,
" defined above, Adding something and waiting to close - remove me.
autocmd CursorHoldI * stopinsert

" ************************************************************
" Use spaces instead of tabs
set expandtab

" Set the number of spaces per tab
set tabstop=4

" Set the number of spaces per indentation level
set shiftwidth=4

" Ensure backspacing removes the correct number of spaces
set softtabstop=4

" Enable auto-indentation
set autoindent
set smartindent

" ************************************************************
" Autosave before leaving buffer
autocmd BufLeave * if &modified | write | endif
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)')) | PlugClean! | endif


" ************************************************************
" Enable both absolute and relative line numbers
set number          " Show absolute line number
set relativenumber  " Show relative line numbers


" ************************************************************
" ************************************************************
" ************************************************************
" ************************************************************
" ************************************************************
" ************************************************************
" ************************************************************

