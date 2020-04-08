setlocal noexpandtab
setlocal tabstop=4
setlocal shiftwidth=4
setlocal textwidth=100

" Turn on line numbers
setlocal number

" Save before running make
setlocal autowrite

" Display help window below the code
"setlocal splitbelow

" Preview window complete options
setlocal completeopt+=noinsert
setlocal completeopt+=noselect
" Close the preview window after complete
autocmd CompleteDone * pclose!

" Call goimports on save
let g:go_fmt_command = "goimports"

" Turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" 'You complete me' plugin options
let g:ycm_auto_trigger=1
let g:ycm_complete_in_strings = 0
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
let g:ycm_key_list_stop_completion = ['<C-y>']
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_goto_buffer_command = 'same-buffer'
" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1

" Map keys to go to definition using a completer
map <C-l> <esc>:YcmCompleter GoTo<cr>
map <C-h> <C-o>
imap <C-l> <esc>:YcmCompleter GoTo<cr>
imap <C-h> <C-o>

let g:go_gopls_enabled = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" Disable syntastic for go because vim-go is used
" let g:syntastic_go_checkers  =['go', 'golint', 'govet', 'errcheck']
let g:syntastic_go_checkers = []
let g:syntastic_check_on_open = 0

" Tagbar settings for Go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
