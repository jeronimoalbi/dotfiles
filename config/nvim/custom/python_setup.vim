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

" Disable syntastic for python because neomake is used
let g:syntastic_python_checkers=['']
let g:syntastic_check_on_open = 0

" Settings for SimpylFold plugin
let g:SimpylFold_docstring_preview = 1

" Command to add docstrings
nmap <silent> <leader>ds :Pydocstring<CR>

" Execute BOS linting command in a container
nnoremap <leader>ml :execute "! make lint files=" . @%<CR>

" Disaple indent highlighting for python syntax plugin
let g:python_highlight_indents = 0

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
" nmap <silent> <C-l> <CR>
nnoremap <C-l> <ESC>:YcmCompleter GoTo<CR>
map <C-h> <C-o>
inoremap <C-l> <ESC>:YcmCompleter GoTo<CR>
inoremap <C-h> <C-o>

" Full code check using <Ctr + c> (long check)
map <C-c> <esc>:Neomake<cr>
imap <C-c> <esc>:Neomake<cr>

" Some useful abbreviations
ab pdb from pprint import pprint as pp;import pdb;pdb.set_trace()
ab ipdb import ipdb;ipdb.set_trace()
ab wpdb import rpdb2; rpdb2.start_embedded_debugger('123')
ab rpdb from remote_pdb import RemotePdb; RemotePdb(host='0.0.0.0', port=4444).set_trace()

" Also insert debugger with a faster shortcut
inoremap <C-s>d import ipdb;ipdb.set_trace()

" Vim switch plugin settings
let b:switch_custom_definitions =
    \ [
    \   {
    \     ':\(\k\+\)\s\+=>': '\1:',
    \     '\<\(\k\+\):':     ':\1 =>',
    \   },
    \ ]

" nnoremap - :call switch#Switch(g:variable_style_switch_definitions)<cr>
nnoremap = :Switch<cr>
