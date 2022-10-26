set nocompatible
" syntax enable
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
set signcolumn

set updatetime=300
set timeoutlen=300

set nobackup
set nowb
set noswapfile

set termguicolors

set undodir=~/.config/nvim/backup/.undo//
set backupdir=~/.config/nvim/backup/.backup//
set directory=~/.config/nvim/backup/.swp//
set rtp +=~/.config/nvim/

call plug#begin('~/.config/nvim/plugged')

" Helpers
Plug 'nvim-lua/plenary.nvim'

" Functionality
Plug 'chr4/nginx.vim'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'sbdchd/neoformat'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/which-key.nvim'
Plug 'hrsh7th/nvim-cmp'

" LSP
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'jayp0521/mason-null-ls.nvim'

" UI
Plug 'folke/lsp-colors.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" CSS
Plug 'norcalli/nvim-colorizer.lua'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

" Typescript
"" Syntax
Plug 'sheerun/vim-polyglot'

" Linters
" Plug 'dense-analysis/ale'

Plug 'editorconfig/editorconfig-vim'

" Navigation
" Plug 'scrooloose/nerdtree'
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'akinsho/bufferline.nvim'

Plug 'jlanzarotta/bufexplorer'
Plug 'mileszs/ack.vim'
" Plug 'kien/ctrlp.vim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'justinmk/vim-sneak'
Plug 'terryma/vim-multiple-cursors'
Plug 'majutsushi/tagbar'

" Interface
" Plug 'vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'

" Colorschemes
Plug 'mhartington/oceanic-next'
Plug 'Mofiqul/vscode.nvim'
Plug 'folke/tokyonight.nvim'

call plug#end()

filetype plugin indent on

lua require'colorizer'.setup()

" auto remove trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
command! E NvimTreeFocus
map <C-e> :NvimTreeFocus<CR>

lua require 'user/colorscheme'
lua require 'user/keymaps'
lua require 'user/cmp'
lua require 'user/nvim-tree'
lua require 'user/telescope'
lua require 'user/lualine'
lua require 'user/bufferline'
lua require 'user/gitsigns'
lua require 'user/treesitter'
lua require 'user/whichkey'
lua require 'user/lsp'

" javascrtipt settings
let g:javascript_plugin_jsdoc = 1

let g:jsx_ext_required = 1

" typescript settings
" let g:tsuquyomi_completion_detail = 1

" Open NERDTree on startup, when no file has been specified
function s:openFileManager()
  if !argc()
    NvimTreeFocus
  endif
endfunction

autocmd VimEnter * call s:openFileManager()

autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype json setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype scss setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype html setlocal ts=4 sw=4 sts=0 expandtab

" Auto-close deoplete preview window
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

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

" let g:airline_powerline_fonts = 1

" let g:ale_linters = {
" \    'typescript': ['eslint', 'tslint', 'tsserver'],
" \    'cs': ['OmniSharp'],
" \}

" Navigate by visual lines
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

cabbrev Ack Ack! --ignore-dir dist

" nmap <silent> <leader>gd <Plug>(coc-definition)
" nmap <silent> <leader>gy <Plug>(coc-type-definition)
" nmap <silent> <leader>gi <Plug>(coc-implementation)
" nmap <silent> <leader>gr <Plug>(coc-references)
" nmap <leader>rn <Plug>(coc-rename)
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" use <tab> for trigger completion and navigate to the next complete item
" inoremap <silent><expr> <Tab>
"       \ coc#pum#visible() ? coc#pum#confirm() :
"       \ "\<Tab>"

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
"
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" autocmd CursorHold * silent call CocActionAsync('highlight')
