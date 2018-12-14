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
inoremap <C-c>fr <Esc>:CtrlPYankring<CR>

" Set the theme for the airline bar plugin
let g:airline_theme='bubblegum'

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
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg)$',
  \ 'file': '\v\.vim$',
  \ }

" List files in repository or using find by default
let g:ctrlp_user_command = {
\ 'types': {
  \ 1: ['.git/', 'cd %s && git ls-files'],
  \ 2: ['.hg/', 'hg --cwd %s locate -I .'],
  \ },
\ 'fallback': 'find %s -type f -not -path "*/\.*" -not -path "*/*egg-*"'
\ }

" Enable some extensions settings
let g:ctrlp_extensions = ['tag']

" Ack settings
" By default change Ack to not open the first matched file
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>

" Isort settings
" Disable isort (python) key mapping
let g:vim_isort_map = ''


" CtrlP Ag settings
let g:ctrlp_ag_ignores = '--ignore .git
    \ --ignore .bash_history
    \ --ignore "*.out"
    \ --ignore "*.log"
    \ --ignore "*.vim"
    \ --ignore "tags"
    \ --ignore "deps/*"
    \ --ignore "_build/*"'

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
nmap <silent> <leader>yr :CtrlPYankring<CR>
inoremap <C-c>yr <Esc>:CtrlPYankring<CR>


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
" Trigger by default with: <C-Y>,
"
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-H>'
let g:user_emmet_settings = {
\ 'javascript.jsx' : {
  \ 'extends' : 'jsx',
  \ },
\ }
autocmd FileType html,css,xml EmmetInstall

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
" Neomake
"
let g:neomake_python_pylint_args = [
    \ '-f', 'text',
    \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
    \ '-d', 'E1101,C0111,R0901',
    \ '-r', 'n'
    \ ]

" Use simple check on save
autocmd BufWritePost *.py :Neomake flake8

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
