setlocal omnifunc=pythoncomplete#Complete
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

" Turn on line numbers
set number

" Wrap text after a certain number of characters
setlocal textwidth=120
set nowrap

" Preview window complete options
setlocal completeopt+=noinsert
setlocal completeopt+=noselect
" Close the preview window after complete
autocmd CompleteDone * pclose!

" Avoid removing indentation after writting #
inoremap # X#

" Display tabs at the beginning of a line in Python mode as bad.
highlight BadTabspace ctermbg=red guibg=red
match BadTabspace /^\t\+/

" Enable full python syntax highlighting
let python_highlight_builtin_objs = 1
let python_highlight_all=1

" Enable higlight of special keywords that normally are disabled
syn keyword pythonBuiltinObj self cls

" Increase the width of the tagbar plugin
let g:tagbar_width = 100

" Disaple indent highlighting for python syntax plugin
let g:python_highlight_indents = 0

" Some useful abbreviations
ab pdb from pprint import pprint as pp;import pdb;pdb.set_trace()
ab ipdb import ipdb;ipdb.set_trace()
ab wpdb import rpdb2; rpdb2.start_embedded_debugger('123')
ab rpdb from remote_pdb import RemotePdb; RemotePdb(host='0.0.0.0', port=4444).set_trace()

" Also insert debugger with a faster shortcut
inoremap <C-s>d import ipdb;ipdb.set_trace()

" Run black on save
"autocmd BufWritePre *.py execute ':Black'
