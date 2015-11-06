set filetype=xml

" Turn on line numbers
set number

"set omnifunc=syntaxcomplete#Complete
set encoding=utf-8
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" set foldlevelstart=1
" set foldlevel=1

" Remove autoindent
set indentexpr=|set cindent

" Enable autocomplete (CTRL-X O)
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
