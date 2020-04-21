" Make it easy to edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>ep :e ~/.config/nvim/custom/plugins.vim<cr>

" Open my vim cheatsheet
"nmap <silent> <leader>cs :sp $HOME/.vim/doc/vim_cheatsheet.txt<CR>

" Edit in place of current file
nmap <leader>e. :e <C-R>=expand("%:p:h") . "/" <CR>

" Paste clipboard content without formatting
noremap <leader>pp :set paste<CR>:put +<CR>:set nopaste<CR>
inoremap <C-c>pp <C-r><C-p>+

" Paste mouse clipboard content without formatting
noremap <leader>pm :set paste<CR>:put *<CR>:set nopaste<CR>
inoremap <C-c>pm <C-r><C-p>*

" Enter visual line mode
nmap <leader><leader> V

" Go to next tab
noremap <leader>tt :tabNext<CR>

" Navigate forward/backward in the tags stack
map <leader>[ <C-T>
map <leader>] g]
" Search tag and if many exists display select window
"nmap <silent> <leader>tt :exec("tselect ".expand("<cword>"))<CR>
"inoremap <C-c>tt <Esc>:exec("tselect ".expand("<cword>"))<CR>

" Mappings to jump to different locations
" 1. Jump to last jump point
map <C-a>l ``
" 2. Jump to last changed line
map <C-a>c `.
" 3. Jump to previous jump point in stack
map <C-a>h <C-o>
" 4. Jump to next jump point in stack
map <C-a>l <Tab>

" Disable search highlight by pressing ,/
nmap <silent> <leader>- :nohlsearch<CR>

" Allow save file using sudo after open it by typing w!!
cmap w!! w !sudo tee % >/dev/null
nmap <silent> <leader>ww w !sudo tee % >/dev/null<CR>
inoremap <C-c>ww <Esc>:w !sudo tee % >/dev/null<CR>

" Toggle line numbers and fold column for easy copying:
nnoremap <silent> <leader>ln :set nonumber!<CR>:set foldcolumn=0<CR>

" Print current file path
nmap <leader>fp :!echo %<CR>

" Define a function to toggle background value
if !exists("BgToggle")
    function BgToggle()
        if &background == "light"
            set background=dark
        else
            set background=light
        endif
    endfunction
endif

" Toggle background dark/light
nmap <silent> <leader>bt :call BgToggle()<cr>
noremap <C-c>bt <Esc>:call BgToggle()<CR>
