set omnifunc=javascriptcomplete#CompleteJS
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Turn on line numbers
set number

" Format the code on save
"""autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" Prettier settings
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx PrettierAsync
