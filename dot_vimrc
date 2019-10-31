set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Chiel92/vim-autoformat'
Plugin 'tomtom/tcomment_vim'
Plugin 'mattn/emmet-vim'
Plugin 'whiteinge/diffconflicts'
Plugin 'easymotion/vim-easymotion'

Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype indent plugin on

""" General

" Use system clipboard
set clipboard=unnamedplus
" Timeout on keycodes, but not on mappings
set notimeout ttimeout ttimeoutlen=200
" Syntax highlighting
syntax on
" Relative line numbers with absolute current line
set number relativenumber
" Use spaces instead of tabs
set shiftwidth=2
set softtabstop=2
set expandtab
" Put backup/undo files in /tmp
set backupdir=/tmp
set undodir=/tmp
" Try to be smart about cases
set smartcase
set ignorecase
" Highlight search results
set hlsearch
set incsearch
set magic
" Better command line completion
set wildmenu
" Show partial commands
set showcmd
" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
set autoindent
" Display cursor position
set ruler
" Ask to save changes instead of failing
set confirm
" Natural split opening
set splitbelow
set splitright
" Trigger `autoread` when files change on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
" Turn off highlight (for instance after matched search)
"nnoremap <silent> <Esc> :noh<Return><Esc>
"map <silent> <esc> :noh<cr>

" Autoformat
let g:formatdef_php_formatter = '"php-formatter"'
let g:formatters_php = ['php_formatter']

" "
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
"
" " Jump to anywhere you want with minimal keystrokes, with just one key binding.
" " `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)
"
" " Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
"
""" Key mappings

" Easy navigation between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

