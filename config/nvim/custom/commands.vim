" Make it easy to edit this file
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>ep :e ~/.config/nvim/custom/plugins.vim<cr>

" Edit in place of current file
nmap <leader>e. :e <C-R>=expand("%:p:h") . "/" <CR>

" Paste after the current line into the next line
nmap P :pu<cr>

" Paste clipboard content without formatting
noremap <leader>pp :set paste<CR>:put +<CR>:set nopaste<CR>
inoremap <C-c>pp <C-r><C-p>+

" Paste mouse clipboard content without formatting
noremap <leader>pm :set paste<CR>:put *<CR>:set nopaste<CR>
inoremap <C-c>pm <C-r><C-p>*

" Go to next tab
noremap <leader>tt :tabNext<CR>

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
