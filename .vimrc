filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
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
" Dracula colorscheme
Plugin 'dracula/vim',{'name':'dracula'}
" Gruvbox colorscheme
Plugin 'morhetz/gruvbox'
" Molokai colorscheme
Plugin 'tomasr/molokai'
" Code folding
Plugin 'tmhedberg/SimpylFold'
" Python indentation
Plugin 'vim-scripts/indentpython.vim'
" Python autocomplete
Plugin 'Valloric/YouCompleteMe'
" Syntax Checking/Highlighting
Plugin 'vim-syntastic/syntastic'
" PEP8 checking
Plugin 'nvie/vim-flake8'
" File tree
Plugin 'scrooloose/nerdtree'
" File tree tabs
Plugin 'jistr/vim-nerdtree-tabs'
" Super searching
Plugin 'kien/ctrlp.vim'
" Fuzzy file searching
Plugin 'junegunn/fzf',{'do':{->fzf#install()}}
" Fuzzy file searching
Plugin 'junegunn/fzf.vim'
" Git commands within vim
Plugin 'tpope/vim-fugitive'
" Comment out line with gcc or gc for section in visual mode
Plugin 'tpope/vim-commentary'
" Provides python specific text objects
Plugin 'jeetsukumaran/vim-pythonsense'
" Powerline status line
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim'}
" Aids in resolving git merge and rebase conflicts
Plugin 'christoomey/vim-conflicted'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set t_Co=256
let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
colorscheme dracula
syntax enable
augroup pythongroup
    au BufNewFile,BufRead *.py
        \ colorscheme molokai |
        \ set tabstop=4 |
        \ set shiftwidth=4 |
        \ set smartindent |
        \ set clipboard=unnamed |
        \ set softtabstop=4 |
        \ set expandtab |
        \ set textwidth=100 |
        \ set fileformat=unix
augroup END

augroup cppgroup
    au BufNewFile,BufRead *.cpp
        \ set tabstop=4 |
        \ set shiftwidth=4 |
        \ set smartindent |
        \ set clipboard=unnamed |
        \ set softtabstop=4 |
        \ set expandtab |
        \ set textwidth=110 |
        \ set fileformat=unix |
        \ set colorcolumn=110 |
        \ highlight ColorColumn ctermbg=darkgray |
        \ set makeprg=make\ -C\ ../build\ -j9 |
        \ nnoremap <F4> :make!<cr>
augroup END

augroup webgroup
    au BufNewFile,BufRead *.js,*.html,*.css
        \ set tabstop=2 |
        \ set softtabstop=2 |
        \ set shiftwidth=2
augroup END

set encoding=utf-8
set number
set relativenumber
set showcmd
set cursorline

filetype indent on
set wildmenu
"set lazyredraw
set nolazyredraw
set showmatch "highlight matching [{()}]

set incsearch " search as characters are entered
set hlsearch " highlight matches

set foldenable
set foldlevelstart=10 "open most folds
set foldnestmax=10 " 10 nested folds max
set exrc
set secure

" space opens/closes folds
nnoremap <space> za
set foldmethod=indent " fold based on indent level

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
map <Leader>g :YcmCompleter GoToDefinitionsElseDeclaration<CR>

" NERDTree settings
map <F2> :NERDTreeToggle<CR>

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0
let g:syntastic_vim_checkers = ['vint']
let g:syntastic_vim_vint_ext = 'LC_CTYPE=UTF-8 vint'
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_mode_map = {'mode': 'passive'}
:command Sc :SyntasticCheck
let g:syntastic_python_checkers = ['python', 'pylint']
let g:syntastic_pylint_args = '--rcfile=/home/vagrant/.pylintrc'
