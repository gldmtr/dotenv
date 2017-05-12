set nocompatible
syntax enable
filetype off

set laststatus=2
set ignorecase
set showcmd
set number

set undodir=~/.config/nvim/backup/.undo//
set backupdir=~/.config/nvim/backup/.backup//
set directory=~/.config/nvim/backup/.swp//

set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Languages

" Ansible
Plugin 'pearofducks/ansible-vim'
" Javascript
Plugin 'pangloss/vim-javascript'
" Typescript
Plugin 'leafgarland/typescript-vim'

" Linters
" Asynchronous Lint Engine
Plugin 'w0rp/ale'

Plugin 'editorconfig/editorconfig-vim'

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'mileszs/ack.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'justinmk/vim-sneak'
Plugin 'terryma/vim-multiple-cursors'


" Interface
Plugin 'vim-airline/vim-airline'

" Functionality
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'AndrewRadev/splitjoin.vim'

call vundle#end()

filetype plugin indent on

" auto remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
command! E NERDTreeToggle
map <C-e> :NERDTreeFocus<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let NERDTreeShowHidden=1

" javascrtipt settings
let g:javascript_plugin_jsdoc = 1

" typescript settings
autocmd FileType typescript setlocal completeopt+=menu,preview

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype scss setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype html setlocal ts=4 sw=4 sts=0 expandtab

" NERD commenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

let g:airline_powerline_fonts = 1

