-- Enable telescope plugins
if package.loaded['telescope'] then
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('repo')
    require('telescope').load_extension('coc')
    require('telescope').load_extension('neoclip')
    require('telescope').load_extension('frecency')

    require('neoclip').setup()
end

-- Set the theme for the airline bar plugin
vim.g.airline_theme = 'bubblegum'

-- Vim move plugin
--
-- Set the meta-key to control movement
vim.g.move_key_modifier = 'C'

-- Emmet (Zencoding)
-- Trigger by default with: <C-y>,
--
vim.g.user_emmet_expandabbr_key = '<C-e>,'
vim.g.user_emmet_install_global = 0
vim.g.user_emmet_settings = {
    javascript = {
        extends = 'jsx',
    },
}
vim.cmd [[ autocmd FileType html,css,xml,*.jsx EmmetInstall ]]

-- JSX (mxw/vim-jsx)
--
-- Enable only for ".jsx" files
vim.g.jsx_ext_required = 1

-- Tagbar
--
vim.g.tagbar_left = 1
vim.g.tagbar_autoclose = 1
vim.g.tagbar_autofocus = 1
vim.g.tagbar_sort = 0

-- Shorter commands to toggle tagbar display
vim.api.nvim_set_keymap(
    'n',
    '<Leader>tl',
    ':TagbarToggle<CR>',
    {noremap = true, silent = true}
)


-- NERDTree
--
-- Show bookmarks on top of the tree
vim.g.NERDTreeShowBookmarks = 1
-- Ignore some files (like python bytecode ones)
vim.g.NERDTreeIgnore = {'.*\\.pyo$', '.*\\.pyc$', '\\~$', '\\.db$', '\\.sqlite$', '__pycache__'}
vim.g.NERDTreeSortOrder = {"^__\\.py$", "\\/$", "*", "\\.swp$", "\\.bak$", "\\~$"}
-- Disable label on top of bookmarks
vim.g.NERDTreeMinimalUI = 1

-- Mundo tree shortcuts
vim.api.nvim_set_keymap(
    'n',
    '<leader>ut',
    ':MundoToggle<CR>',
    {noremap = true, silent = true}
)

-- Disable Any-jump default key bindings
vim.g.any_jump_disable_default_keybindings = 1
-- Auto group results by filename
vim.g.any_jump_grouping_enabled = 1
-- Search references only for current file type
vim.g.any_jump_references_only_for_current_filetype = 1
-- Search in untracked VCS files too
vim.g.any_jump_disable_vcs_ignore = 1
-- Make sure Ripgrep is used by default to search reference
vim.g.any_jump_search_prefered_engine = 'rg'

-- Any-Jump shortcuts
vim.api.nvim_set_keymap(
    'n',
    '<leader><leader>',
    ':AnyJump<CR>',
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    'n',
    '<leader>.',
    ':AnyJumpBack<CR>',
    {noremap = true, silent = true}
)

-- Display Telescope frecency (MRU)
vim.api.nvim_set_keymap(
    'n',
    '<leader>fm',
    "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
    {noremap = true, silent = true}
)
