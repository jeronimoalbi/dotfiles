" Shorcut for NERDTree
nmap <silent> <leader>nt :NERDTreeFind<cr>
inoremap <C-c>nt <Esc>:NERDTreeFind<CR>

" Shorcut for Ctrlp
nmap <silent> <leader>ff :CtrlP<cr>
nmap <silent> <leader>fm :CtrlPMRU<cr>
nmap <silent> <leader>fb :CtrlPBuffer<cr>
nmap <silent> <leader>ft :CtrlPTag<cr>
inoremap <C-c>ff <Esc>:CtrlP<CR>
inoremap <C-c>fm <Esc>:CtrlPMRU<CR>
inoremap <C-c>fb <Esc>:CtrlPBuffer<CR>
inoremap <C-c>ft <Esc>:CtrlPTag<CR>

"
" Ctrlp settings
"

" Display window on top
let g:ctrlp_match_window_bottom = 0

" Exclude some files from MRU list
let g:ctrlp_mruf_exclude = '/tmp/.*\|/temp/.*'

" Dont search hidden files and dirs
let g:ctrlp_dotfiles = 0

" Ignore files independently of wildignore
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'

" List files in repository or using find by default
let g:ctrlp_user_command = {
\ 'types': {
  \ 1: ['.git/', 'cd %s && git ls-files'],
  \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
  \ },
\ 'fallback': 'find %s -type f'
\ }

" Enable some extensions
let g:ctrlp_extensions = ['tag']

"
" Vim move plugin
"
" Set the meta-key to control movement
let g:move_key_modifier = 'C'

"
" Region expand trigger
" terryma/vim-expand-region
"
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"
" Yankring settings
"
nmap <silent> <leader>yr :YRShow<CR>
inoremap <C-c>yr <Esc>:YRShow<CR>

"
" Taglist plugin settings
"

" Displays taglist results in a vertical window:
let Tlist_Use_Horiz_Window = 0

" Shorter commands to toggle Taglist display
nnoremap TT :TagbarToggle<CR>
nmap <Leader>tl :TagbarToggle<CR>
inoremap <C-c>tl <Esc>:TagbarToggle<CR>

"
" Emmet (Zencoding)
" Trigger with: <C-Y>,
"
let g:user_emmet_install_global = 0
autocmd FileType html,css,pt,zcml,xml EmmetInstall

"
" Tagbar
"
let g:tagbar_left=1
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_sort=0

"
" NERDTree
"
" Show bookmarks on top of the tree
let NERDTreeShowBookmarks = 1

" Ignore some files (like python bytecode ones)
let NERDTreeIgnore=['.*\.pyo$', '.*\.pyc$', '\~$', '\.db$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']

" DIsable label on top of bookmarks
let NERDTreeMinimalUI=1

"
" Syntastic
"
" Disable status bar text
let g:syntastic_stl_format = ''

" Filter some pylint error codes
let g:syntastic_python_pylint_args = '-d E1101,C0111  --msg-template="{path}:{line}: [{msg_id}] {msg}" -r n'

" Disable xmllint
let g:loaded_syntastic_xml_xmllint_checker = 0

" Set python checker list
let g:syntastic_python_checkers = ['python', 'flake8', 'pylint', 'py3kwarn']

" Set javascriot checkers
let g:syntastic_javascript_checkers = ['jshint']

" Dont check on open or save
let g:syntastic_check_on_open = 0

" Use simple check on save
autocmd BufWritePost *.py :SyntasticCheck flake8

"
" Quickfix signs
"
" Which gutter symbols to display:
"
"   rel     ... relative line numbers
"   cursor  ... current line
"   qfl     ... |quickfix| list
"   loc     ... |location| list
"   vcsdiff ... mark changed lines
"   marks   ... marks |'a|-zA-Z
let g:quickfixsigns_classes=['qfl', 'loc', 'marks', 'breakpoints']

" Gundo
nnoremap <leader>ut :GundoToggle<CR>
inoremap <C-c>ut <Esc>:GundoToggle<CR>

" Vim better whitespace
highlight ExtraWhitespace ctermbg=red
nnoremap <leader>ws :ToggleWhitespace<CR>
nnoremap <leader>wd :StripWhitespace<CR>
inoremap <C-c>ws <Esc>:ToggleWhitespace<CR>

" Ultisnips settings
" Note: Do not use <tab> if you use "YouCompleteMe"
let g:UltiSnipsExpandTrigger="<c-c>ss"
let g:UltiSnipsJumpForwardTrigger="<c-c>k"
let g:UltiSnipsJumpBackwardTrigger="<c-c>j"
" Make :UltiSnipsEdit split window
let g:UltiSnipsEditSplit="vertical"
