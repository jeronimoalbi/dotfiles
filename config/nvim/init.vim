let s:editor_root=expand("~/.config/nvim")

let g:python_host_prog = 'python'
let g:python3_host_prog = 'python3'

" Use comma as shortcut prefix
let mapleader = ","

" Allow vim to switch buffers when when current buffer
" is not saved.
set hidden

" Turn backup files off
set nobackup
set nowb
set noswapfile

" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
set tabstop=4
" Make backspace use 4 characters
set softtabstop=4
" What to use for an indent
set shiftwidth=4
set expandtab

" Disable page up and page down
map <PageUp> <NOP>
map <PageDown> <NOP>
imap <PageUp> <NOP>
imap <PageDown> <NOP>

" Enables 24-bit RGB color
set termguicolors

" Set dark background
set background=dark

" Install plugins
call plug#begin('~/.config/nvim/plugged')
runtime custom/plugins.vim
call plug#end()

" Select the color theme to enable.
" NOTE: Plugins must be loaded before.
silent! colorscheme seoul256

" Enable selected line marker after themes was applied
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" By default load tags from 'tags' files
set tags=tags

" Setup plugins
runtime custom/plugins_setup.vim
" Custom commands
runtime custom/commands.vim

" Load settings by file type
au BufRead,BufNewFile *.py runtime custom/autoload/python.vim
au BufRead,BufNewFile *.go runtime custom/autoload/go.vim
au BufRead,BufNewFile *.json runtime custom/autoload/json.vim
au BufRead,BufNewFile *.js runtime custom/autoload/javascript.vim
au BufRead,BufNewFile *.jsx runtime custom/autoload/javascript.vim
au BufRead,BufNewFile *.sol runtime custom/autoload/solidity.vim
au BufRead,BufNewFile *.xml runtime custom/autoload/html.vim
au BufRead,BufNewFile *.html runtime custom/autoload/html.vim
