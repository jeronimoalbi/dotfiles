vim.g.python_host_prog = "python"
vim.g.python3_host_prog = "python3"

-- Use comma as shortcut prefix
vim.g.mapleader = ","

-- Allow vim to switch buffers when when current buffer is not saved
vim.opt.hidden = true

-- Turn backup files off
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Make sure 4 spaces are used instead of tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enables 24-bit RGB color
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Install plugins
require('plugins')
require('plugins_setup')

-- How dark or light the seoul them should be
-- Dark: 233 (darkest) ~ 239 (lightest)
-- Light: 252 (darkest) ~ 256 (lightest)
vim.g.seoul256_background = 237

-- Select the color theme to enable.
-- NOTE: Plugins must be loaded before.
vim.cmd [[ colorscheme seoul256 ]]

-- Enable selected line marker after themes was applied
vim.opt.cursorline = true
vim.cmd [[
    autocmd WinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
]]

-- By default load tags from 'tags' files
vim.opt.tags = {'tags'}

-- Setup plugins
vim.cmd [[ runtime custom/plugins_setup.vim ]]
-- Custom commands
vim.cmd [[ runtime custom/commands.vim ]]

-- Load settings by file type
vim.cmd [[
    au BufRead,BufNewFile *.py runtime custom/autoload/python.vim
    au BufRead,BufNewFile *.go runtime custom/autoload/go.vim
    au BufRead,BufNewFile *.json runtime custom/autoload/json.vim
    au BufRead,BufNewFile *.js runtime custom/autoload/javascript.vim
    au BufRead,BufNewFile *.jsx runtime custom/autoload/javascript.vim
    au BufRead,BufNewFile *.sol runtime custom/autoload/solidity.vim
    au BufRead,BufNewFile *.xml runtime custom/autoload/html.vim
    au BufRead,BufNewFile *.html runtime custom/autoload/html.vim
]]
