" Turn off vi compatibility, use advanced vim-only features
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'

" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Enable filetype plugins
"filetype plugin on
"filetype indent on

" Show (partial) command in status line.
set showcmd
" Display options
set showmode
" Show matching brackets.
set showmatch
" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>
" Automatically save before commands like :next and :make
set autowrite
" Enable mouse usage (all modes)
set mouse=a
" Turn off modelines
set modelines=0
" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Status bar
set laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
set statusline=%.50F%m%r%h%w\ [%{&ff}\ %Y]\ [%l/%L,%v\ %p%%]\ [BUF=%n]\ %{strftime(\"%d/%m/%y\ %H:%M\")}

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30

" Turn on syntax highlighting
syntax enable
set background=dark
"let g:solarized_termcolors=256
let g:solarized_italic=1
let g:solarized_underlined=1
let g:solarized_contrast="high"
colorscheme solarized

" nerd-commenter settings
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
let mapleader=","

" Set colors to use 256 color palette
"set t_Co=256

"highlight Normal ctermbg=236
"highlight SpecialKey guifg=DarkRed ctermfg=DarkRed guibg=Black ctermbg=Black
" Display different types of white spaces.
set list
set listchars=tab:»-,trail:·,extends:#,nbsp:.
"eol:⏎
" Show line numbers
set number
"highlight LineNr ctermfg=grey

set lbr
set textwidth=500
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab

" Case insensitive search
set ignorecase
" Unless there is mixed case, then make it case sensitive
set smartcase
" Highlight search terms instead of just moving the cursor
set hlsearch
" Highlight search terms as you type them
set incsearch

" Use the system clipboard as the default copy register
set clipboard=unnamed
" Copy indentation level when creating a new line
set autoindent
" Try to put the indent level at the right place
set smartindent
" Keep vim files in the ~/.vim folder
set viminfo='100,<9999,s100,h,n~/.vim/viminfo

" This will save you when you discover you
" don't have permission to save a file
cnoremap w!! w !sudo tee % >/dev/null

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Vim Plug automatic installation
" if empty(glob('~/.vim/autoload/plug.vim'))
"     silent !curl -fsLo ~/.vim/autoload/plug.vim \
"         --create-dirs https://raw.githubusercontent.com\
"         /junegunn/vim-plug/master/plug.vim
"     autocmd VimEnter * PlugInstall | source $MYVIMRC
" endif

" Sets how many lines of history VIM has to remember
" set history=500

" Set to auto read when a file is changed from the outside
" set autoread
"autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

set formatoptions=n1
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
