set filetype=xml
set syntax=xml

" Turn on line numbers
set number

"set omnifunc=syntaxcomplete#Complete
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Remove autoindent
set indentexpr=|set cindent

" Enable autocomplete (CTRL-X O)
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
