set nocompatible
syntax enable
filetype off

set hidden

set nobackup
set nowritebackup

set laststatus=2
set ignorecase
set showcmd
set number
set conceallevel=0
set cursorline
set nohlsearch

set nobackup
set nowb
set noswapfile

set undodir=~/.config/nvim/backup/.undo//
set backupdir=~/.config/nvim/backup/.backup//
set directory=~/.config/nvim/backup/.swp//

call plug#begin('~/.config/nvim/plugged')

" Functionality
Plug 'chr4/nginx.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'sbdchd/neoformat'

" CSS
Plug 'ap/vim-css-color'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

" Typescript
"" Syntax
Plug 'HerringtonDarkholme/yats.vim'
"" IDE
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }

" Other languages
Plug 'rust-lang/rust.vim'

"
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Linters
" Asynchronous Lint Engine
Plug 'w0rp/ale'

Plug 'editorconfig/editorconfig-vim'

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'jlanzarotta/bufexplorer'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'justinmk/vim-sneak'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'

" Interface
Plug 'vim-airline/vim-airline'

" Colorschemes
Plug 'mhartington/oceanic-next'


call plug#end()

filetype plugin indent on

colorscheme OceanicNext

" auto remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
command! E NERDTreeToggle
map <C-e> :NERDTreeFocus<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 50

" javascrtipt settings
let g:javascript_plugin_jsdoc = 1

let g:jsx_ext_required = 1

" typescript settings
let g:tsuquyomi_completion_detail = 1

" Open NERDTree on startup, when no file has been specified
autocmd VimEnter * if !argc() | NERDTree | endif

" autocmd FileType typescript setlocal completeopt+=menu,preview

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype scss setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype html setlocal ts=4 sw=4 sts=0 expandtab

" Auto-close deoplete preview window
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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

let g:typescript_indent_disable = 1

let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1
" let g:deoplete#num_processes = 1

" This line enables the true color support.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Note, the above line is ignored in Neovim 0.1.5 above, use this line instead.
set termguicolors

let g:ale_linters = {
\    'javascript': ['eslint'],
\    'typescript': ['tslint'],
\}
let g:ale_typescript_tslint_executable = 'tslint'

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" Navigate by visual lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

cabbrev Ack Ack!

let g:deoplete#auto_completion_start_length = 0
