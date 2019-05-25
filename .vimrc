" Plugins using vim-plug
call plug#begin()

"Include a gutter to the side that indicates line changes and light statusbar
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'

"Git Wrapper
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Provides filetree and tagbar
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

"Allow camelcasemotion
Plug 'vim-scripts/camelcasemotion'

"Emmet help for html
Plug 'mattn/emmet-vim'

"Autocompletion
Plug 'Valloric/YouCompleteMe'

" Allow f/t/F/T to be used again to advance instead of ;
Plug 'rhysd/clever-f.vim'

" Linting and Syntax Checker
Plug 'w0rp/ale'

" Asynhronous auto/save cmds
Plug 'skywind3000/asyncrun.vim'

"Easier surround, commenting out, repeat plugins
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

"Language Specific
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'

"A E S T H E T I C S
Plug 'junegunn/seoul256.vim'

call plug#end()

"Basic Config

"Set compatibility to Vim only.
set nocompatible

filetype plugin indent on

"Turn on syntax highlighting on
syntax on 

"For Airline
set laststatus=2

"Show last command in bottom of vim terminal
set showcmd

"Show matching {[(<>)]} when over a brace
set showmatch
set matchpairs+=<:>

"Ignore case when searching and ignore when youre searching for a capital letter
set ignorecase
set smartcase

"Always show left gutter
:set signcolumn=yes

"Tab configuration
set tabstop=2 shiftwidth=2 expandtab
set smarttab

"Put backups somewhere else
set backupdir=~/.backups//
set directory=~/.backups//
set undodir=~/.backups//

"Highlight matching search patterns
set hlsearch

"Show pattern matching as you're typing it
set incsearch

"Let backspace work in vim lol
set backspace=2

"Hides buffers... I think?
set hidden

"Allows autocomplete for command menu
set wildmenu

set scrolloff=4

"Copy indent when starting a new line
set autoindent
set cindent

"Expand tab to spaces
set expandtab

set encoding=utf-8

set noshowmode
set autoread

"Speed up scrolling in vim
set ttyfast

"Allow using mouse
set mouse=a

"Custom key mappings
nnoremap ; :
inoremap jk  <esc>
let mapleader = "\<Space>"

"Press enter to get rid of highlighted text after search
nnoremap <CR> :noh<CR><CR>

"Quickly move to beginning and end of line
map H 0
map L $

"Use system clipboard
set clipboard=unnamed

"Move cursor ignoring line wrapping
" nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
" nnoremap <expr> gj (v:count == 0 ? 'j' : 'gj')
" nnoremap <expr> gk (v:count == 0 ? 'k' : 'gk')

"Chrome-like tab instantiation. n/b to move next/previous
nnoremap <C-t> :tabnew<CR>
nnoremap <C-b> :tabprevious<CR>
nnoremap <C-n> :tabnext<CR>
inoremap <C-t> <Esc>:tabnew<CR>
inoremap <C-b> <Esc>:tabprevious<CR>i
inoremap <C-n> <Esc>:tabnext<CR>i

"Plugin Mappings/Settings

"Nerd Tree Mappings
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>m :NERDTreeFind<CR>

let NERDTreeShowHidden=1

"camel_case motion
map <silent> W <plug>CamelCaseMotion_w
map <silent> B <Plug>CamelCaseMotion_b
map <silent> E <Plug>CamelCaseMotion_e
sunmap W
sunmap B
sunmap E

"FZF mappings
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nnoremap <C-p> :Files<Cr>

"Edit Vimrc in vsplit and source
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Ale Syntax Checkers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'ruby': ['rubocop']
\}

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

"Asynchronously run eslint on save
" TODO get this for js too
autocmd BufWritePost *.jsx AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %
autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

"Auto-fix file according to ale fixers
nnoremap <silent> <Leader>fx :ALEFix

"Run ripgrep on current word
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

" colorscheme 
let g:seoul256_background = 235
set background=dark
colo seoul256

let g:lightline = {
  \ 'colorscheme': 'seoul256',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
\ }

"Add True Colors for Material Colorscheme (both nvim and vim)
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"Relative Numbers when normal mode, absolute when insert
:set number relativenumber

" Emmet settings
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

"Hybrid line number display
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
