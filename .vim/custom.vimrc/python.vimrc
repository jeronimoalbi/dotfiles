set omnifunc=pythoncomplete#Complete
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Turn on line numbers
set number

" Wrap text after a certain number of characters
set textwidth=80
set wrap

" Folding based on indentation
" set foldmethod=indent
" set foldnestmax=2

" Autoindent after keywords
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" Avoid removing indentation after writting #
inoremap # X#

" Set the default file encoding to UTF-8
set encoding=utf-8

" Display tabs at the beginning of a line in Python mode as bad.
highlight BadTabspace ctermbg=red guibg=red

match BadTabspace /^\t\+/

" Enable full python syntax highlighting
let python_highlight_builtin_objs = 1
let python_highlight_all=1

" Enable higlight of special keywords that normally are disabled
syn keyword pythonBuiltinObj self cls

" Settings for SimpylFold plugin
let g:SimpylFold_docstring_preview = 1

" Full Syntastic check using <Ctr + c> (long check)
map <C-c> <esc>:SyntasticCheck<cr>
imap <C-c> <esc>:SyntasticCheck<cr>

" Some useful abbreviations
ab _pdb import ipdb;ipdb.set_trace()

" Also insert debugger with a faster shortcut
inoremap <C-s>d import ipdb;ipdb.set_trace()
