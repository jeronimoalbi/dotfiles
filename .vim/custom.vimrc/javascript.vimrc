set encoding=utf-8
set omnifunc=javascriptcomplete#CompleteJS
set textwidth=80
set foldmethod=syntax
set foldlevelstart=1
set foldnestmax=2
syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
endfunction
set foldtext=FoldText()

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Turn on line numbers
set number
