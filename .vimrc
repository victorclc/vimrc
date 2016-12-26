set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'pangloss/vim-javascript'

call vundle#end()            " required
filetype plugin indent on    " required

color ron 
syntax on

set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set number
set showmatch
set ruler
set laststatus=2
set hlsearch

" For the tagbar plugin
nmap <F8> :TagbarToggle<CR>

" For the syntastic plugin
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" Some custom commands
command! MakeTags ! ctags -R .
command -nargs=+ GG :execute "grep -Isr -a --text --exclude='*.o*' --exclude='*.so*' --exclude='tags' --exclude='*.swp' --exclude='beet' --exclude='*.o' --exclude='*.files' --exclude='*.conf' --exclude='*.mk' " . "<args>" . " *" <Bar> cw

" Binds
map <C-t> <esc>:tabnew<CR>
map <F4> :execute "grep -Isr -a --text --exclude='*.o*' --exclude='*.so*' --exclude='tags' --exclude='*.swp' --exclude='beet' --exclude='*.o' --exclude='*.files' --exclude='*.conf' --exclude='*.mk' " . expand("<cword>") . " *" <Bar> cw<CR>

" Go to definition open a vertical split
