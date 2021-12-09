"set omnifunc=javascriptcomplete#CompleteJS
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
autocmd BufWritePre *.js PrettierAsync

" Search references also in other file types.
" This is useful for js, jsx, ts and tsx jumps.
let g:any_jump_references_only_for_current_filetype = 0
