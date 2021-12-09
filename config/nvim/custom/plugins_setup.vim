" Set the theme for the airline bar plugin
let g:airline_theme='bubblegum'

"
" Vim move plugin
"
" Set the meta-key to control movement
let g:move_key_modifier = 'C'

"
" Emmet (Zencoding)
" Trigger by default with: <C-y>,
"
let g:user_emmet_expandabbr_key = '<C-e>,'
let g:user_emmet_install_global = 0
let g:user_emmet_settings = {
\ 'javascript' : {
  \ 'extends' : 'jsx',
  \ },
\ }
autocmd FileType html,css,xml,*.jsx EmmetInstall

"
" JSX (mxw/vim-jsx)
"
" Enable only for ".jsx" files
let g:jsx_ext_required = 1

"
" Tagbar
"
let g:tagbar_left=1
let g:tagbar_autoclose=1
let g:tagbar_autofocus=1
let g:tagbar_sort=0

" Shorter commands to toggle tagbar display
nmap <Leader>tl :TagbarToggle<CR>

"
" NERDTree
"
" Show bookmarks on top of the tree
let NERDTreeShowBookmarks = 1
" Ignore some files (like python bytecode ones)
let NERDTreeIgnore=['.*\.pyo$', '.*\.pyc$', '\~$', '\.db$', '\.sqlite$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
" Disable label on top of bookmarks
let NERDTreeMinimalUI=1

" Shorcut for NERDTree
nmap <silent> <leader>nt :NERDTreeFind<cr>

" Mundo tree shortcuts
nnoremap <leader>ut :MundoToggle<CR>

" Disable Any-jump default key bindings
let g:any_jump_disable_default_keybindings = 1
" Auto group results by filename
let g:any_jump_grouping_enabled = 1
" Search references only for current file type
let g:any_jump_references_only_for_current_filetype = 1
" Search in untracked VCS files too
let g:any_jump_disable_vcs_ignore = 1
" Make sure Ripgrep is used by default to search reference
let g:any_jump_search_prefered_engine = 'rg'

" Any-Jump shortcuts
nnoremap <leader><leader> :AnyJump<CR>
nnoremap <leader>. :AnyJumpBack<CR>
