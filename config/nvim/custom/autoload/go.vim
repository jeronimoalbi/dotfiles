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

" Disable vim-go key mappings
let g:go_def_mapping_enabled = 0

" Don't warn when using an unsupported version of vim
let g:go_version_warning = 0

" Call goimports on save
let g:go_fmt_command = "goimports"

" Turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_gopls_enabled = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

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

" Show function signature
nmap <leader>gs  <Plug>(go-info)

" Go to definition and back
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gg <C-o>

" Show implemented interfaces
nmap <leader>gi <Plug>(go-implements)

" Rename/refactor symbol under cursor
nmap <leader>gr <Plug>(coc-rename)
