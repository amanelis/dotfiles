set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Github
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tmhedberg/matchit'
Plugin 'kana/vim-vspec'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'vim-scripts/mayansmoke'
Plugin 'tpope/vim-vividchalk'
Plugin 'shougo/unite.vim'
Plugin 'marcweber/vim-addon-async'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-dispatch'
Plugin 'airblade/vim-gitgutter'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'shougo/vimproc.vim' " must $> make this plugin before it will work

Bundle 'thoughtbot/vim-rspec'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'flazz/vim-colorschemes'
Bundle 'ColorSchemeMenuMaker'
Bundle 'desert-warm-256'

runtime macros/matchit.vim

" Plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'BufOnly.vim'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
colorscheme molokai
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
filetype indent on        " activates indenting for files

set t_Co=256              " enable 256-color mode.
set number                " show line numbers
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set nobackup
set noswapfile
set noerrorbells 
set novisualbell
set mouse=a
set ttymouse=xterm2

let mapleader=","
map <Leader>n <plug>NERDTreeTabsToggle<CR>

map <C-l> :tabn<CR>
map <C-h> :tabp<CR>
map <C-n> :tabnew<CR>

nnoremap <C-p> :Unite file_rec/async<cr>
nnoremap <C-o> :Unite outline -vertical <cr>
nnoremap <silent> <C-p> :Unite -start-insert -buffer-name=files -winheight=10 file_rec/async<cr>
nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>
nnoremap <Leader>f :Unite grep:.<cr>
nnoremap <silent><leader>ll :<C-u>UniteResume<CR>

let g:rspec_runner = "os_x_iterm"
let g:rspec_command = "!spring rspec --drb {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec/async','sorters','sorter_rank')
let g:unite_source_grep_default_opts = "-iRHn"
      \ . " --exclude='*.svn*'"
      \ . " --exclude='*.git*'"
      \ . " --exclude='*.log*'"
      \ . " --exclude='*tmp*'"
      \ . " --exclude='*tags*'"
      \ . " --exclude='*schema.rb*'"
      \ . " --exclude='*structure.sql*'"
      \ . " --exclude-dir='**/tmp'"
      \ . " --exclude-dir='CVS'"
      \ . " --exclude-dir='.svn'"
      \ . " --exclude-dir='.git'"
      \ . " --exclude-dir='public'"
      \ . " --exclude-dir='coverage'"
      \ . " --exclude-dir='log'"
      \ . " --exclude-dir='node_modules'"
