" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" Example plugins
Plug 'tpope/vim-sensible'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Install fzf binary
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdtree'

Plug 'tpope/vim-surround'

Plug 'scrooloose/syntastic'

" Plug 'vim-airline/vim-airline'
" Plug 'itchyny/lightline.vim'

Plug 'liuchengxu/vim-which-key'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

Plug 'wellle/context.vim'

Plug 'preservim/nerdcommenter'

Plug 'mhinz/vim-startify'

call plug#end()


