" NERDTree settings
let g:NERDTreeWinPos = "left"        " Always open on the left
let g:NERDTreeShowHidden = 1         " Show hidden files
let g:NERDTreeMinimalUI = 0          " Use minimal UI for better experience

" Auto-open NERDTree on Vim startup
" autocmd VimEnter * NERDTree

" Keep NERDTree open when switching buffers
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree' && bufname('%') !~ 'NERD_tree' | NERDTreeMirror | endif

" Reopen NERDTree if it is accidentally closed
" autocmd BufEnter * if !bufexists("NERD_tree_1") && winnr('$') == 1 | NERDTree | endif

" Prevent NERDTree from hijacking focus on startup
" autocmd VimEnter * if !argc() | NERDTree | wincmd p | endif



" something

" ************************************************************
" Context.vim plugin settings.
let g:context_enabled = 1
let g:context_highlight_normal = 'Normal'
let g:context_highlight_border = 'Comment'
let g:context_highlight_tag    = 'Special'


" ************************************************************
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" By default timeoutlen is 1000 ms
set timeoutlen=0


" ************************************************************
" Toggle comments with Space + /
nnoremap <leader>/ :NERDCommentToggle<CR>
vnoremap <leader>/ :NERDCommentToggle<CR>

" NERDCommenter settings
let g:NERDSpaceDelims = 1         " Add a space after the comment delimiter
let g:NERDDefaultAlign = 'left'  " Align comments to the left
let g:NERDCreateDefaultMappings = 0 " Disable default mappings


