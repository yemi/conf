set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'geoffharcourt/one-dark.vim'
Plugin 'vim-scripts/peaksea'
Plugin 'raichoo/purescript-vim'
Plugin 'crusoexia/vim-monokai'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wavded/vim-stylus'
Plugin 'mattn/emmet-vim'
Plugin 'django.vim'
Plugin 'othree/html5.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'
Plugin 'lambdatoast/elm.vim'
Plugin 'scrooloose/syntastic'
Plugin 'frigoeu/psc-ide-vim'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set number        " Show line numbers
syntax enable     " Use syntax highlighting

" By default, in insert mode backspace won't delete over line breaks, or
" automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" Reload files changed outside vim
set autoread

" Activate omnicompletion
set omnifunc=syntaxcomplete#Complete

" Set leader
let mapleader="`"

" NERDTree tabs
map <leader>nn :NERDTreeTabsToggle<CR>
map <c-k> :tabn<cr>
map <c-j> :tabp<cr>
map <c-n> :tabnew<cr>
let g:nerdtree_tabs_open_on_console_startup = 1

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['jscs']

" Silver Searcher (Ag)
let g:ag_working_path_mode="r"

" Indentation
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 space

" Theme
set background=dark
colorscheme peaksea
