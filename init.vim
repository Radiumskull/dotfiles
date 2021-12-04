"
" General Settings 
"
set number relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set showmatch	
set visualbell
set hidden
 
set nohlsearch
set smartcase
set ignorecase
set incsearch
set cursorline
set encoding=UTF-8
set linebreak
 
set autoindent
set shiftwidth=2
set smartindent
set smarttab	
set softtabstop=2	
set clipboard+=unnamedplus

set nobackup
set noswapfile
set undodir=~/AppData/Local/nvim/undodir
set undofile
set history=1000

set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set noshowmode
set nowrap
set nu
set hidden
set termguicolors
set exrc
set guicursor=

" set colorcolumn=100
set updatetime=300
set redrawtime=10000
set shortmess+=c
set cmdheight=2

set guifont=Fira\ Code:h14
highlight ColorColumn ctermbg=0 guibg=lightgrey

syntax enable

" Variables
let mapleader = " "

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

let g:loaded_python_provider = 0
let g:python3_host_prog = "C:/Users/whois/.pyenv/pyenv-win/versions/3.6.5/python3.exe"

" COC Variables



"
" Plugins 
"
call plug#begin('~/AppData/Local/nvim/plugged')
  " Interface and Theme
  Plug 'gruvbox-community/gruvbox'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'SirVer/ultisnips'
  Plug 'mlaursen/vim-react-snippets'

  Plug 'chun-yang/auto-pairs'
  Plug 'kien/rainbow_parentheses.vim'

  Plug 'ryanoasis/vim-devicons'

  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  Plug 'unblevable/quick-scope'
  Plug 'mkitt/tabline.vim'
 
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'manasthakur/vim-commentor'

  source ~/AppData/Local/nvim/plugins/telescope.vim
  source ~/AppData/Local/nvim/plugins/coc.vim
  source ~/AppData/Local/nvim/plugins/nerdtree.vim

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'mhinz/vim-startify'
call plug#end()


lua << EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

EOF


colorscheme gruvbox







" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" use to change 
nnoremap <C-l> :tabn <CR>
nnoremap <C-h> :tabp <CR>


" Ctrl-f{char} to move to {char}
map  <C-f> <Plug>(easymotion-bd-f)
nmap <C-f> <Plug>(easymotion-overwin-f)



" Save on CTRL-S
nnoremap <C-s> :w <CR>



" Switch to Normal Mode
imap jk <ESC>



" Neovim Config Path Variable
nmap <leader>ve :edit ~/AppData/Local/nvim/init.vim <cr>
nmap <leader>vc :edit ~/AppData/Local/nvim/coc-settings.json <cr>
nmap <leader>vr :source  ~/AppData/Local/nvim/init.vim <cr>

" Open a file mentioned in the File even if it does not exist
map gf :edit <cfile><cr>


" Reselect after indentation
vnoremap < <gv
vnoremap > >gv


