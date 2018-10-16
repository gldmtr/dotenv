set nocompatible
syntax enable
filetype off

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
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sbdchd/neoformat'

" Languages
" Ansible
Plug 'pearofducks/ansible-vim'

" CSS
Plug 'ap/vim-css-color'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'

" Typescript
"" Syntax
Plug 'HerringtonDarkholme/yats.vim'
"" IDE
Plug 'mhartington/nvim-typescript'

" Elm
Plug 'elmcast/elm-vim'

" Nginx config
Plug 'chr4/nginx.vim'

"Go lang
Plug 'fatih/vim-go'
Plug 'godoctor/godoctor.vim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'jodosha/vim-godebug'

" Linters
" Asynchronous Lint Engine
Plug 'w0rp/ale'

Plug 'editorconfig/editorconfig-vim'

" Navigation
Plug 'vim-scripts/taglist.vim'
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
autocmd Filetype elm setlocal ts=4 sw=4 sts=0 expandtab
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

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
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#num_processes = 1

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:deoplete#sources#go#gocode_binary = '/Users/someone/projects/go/bin/gocode'

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
let g:go_list_type = "quickfix"

" This line enables the true color support.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Note, the above line is ignored in Neovim 0.1.5 above, use this line instead.
set termguicolors

" let g:tagbar_type_typescript = {
"   \ 'ctagsbin' : 'tstags',
"   \ 'ctagsargs' : '-f-',
"   \ 'kinds': [
"     \ 'e:enums:0:1',
"     \ 'f:function:0:1',
"     \ 't:typealias:0:1',
"     \ 'M:Module:0:1',
"     \ 'I:import:0:1',
"     \ 'i:interface:0:1',
"     \ 'C:class:0:1',
"     \ 'm:method:0:1',
"     \ 'p:property:0:1',
"     \ 'v:variable:0:1',
"     \ 'c:const:0:1',
"   \ ],
"   \ 'sort' : 0
"   \ }


let g:ale_linters = {
\    'typescript': ['tslint'],
\}
let g:ale_typescript_tslint_executable = 'tslint'

function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction


" let b:ale_fixers = [
" \   'DoSomething',
" \   'eslint',
" \   {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
" \]

