if !has("gui_running")
    colorscheme distinguished

    " Add events to remove scrollbars in gnome-terminal
    if $COLORTERM == 'gnome-terminal'
        " TODO: Create a proper toggle function for scrollbar settings in linux
        " autocmd VimEnter * call system("gconftool-2 --set '/apps/gnome-terminal/profiles/Default/scrollbar_position' --type string 'hidden'")
        " autocmd VimLeave * call system("gconftool-2 --set '/apps/gnome-terminal/profiles/Default/scrollbar_position' --type string 'right'")
        autocmd VimEnter * silent execute "!gconftool-2 --set '/apps/gnome-terminal/profiles/Default/scrollbar_position' --type string 'hidden'"
        autocmd VimLeave * silent execute "!gconftool-2 --set '/apps/gnome-terminal/profiles/Default/scrollbar_position' --type string 'right'"
    endif
endif

" Add a mapping to toggle fullscreen (Requires compiz and the wmctrl command)
map <silent> <leader>FF :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
