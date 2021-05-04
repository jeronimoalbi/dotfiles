set omnifunc=javascriptcomplete#CompleteJS
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Turn on line numbers
set number

" Use the project's eslint instead of the system one
let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'

" Prettier settings
let g:prettier#quickfix_enabled = 1
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1

" Run prettier
autocmd BufWritePre *.js PrettierAsync
