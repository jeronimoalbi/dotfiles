set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Turn on line numbers
set number

" Prettier settings
let g:prettier#quickfix_enabled = 1
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1

" Run prettier
autocmd BufWritePre *.sol PrettierAsync

" Recommended for the dmdque/solidity.vim plugin
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPost make nested copen
augroup END
