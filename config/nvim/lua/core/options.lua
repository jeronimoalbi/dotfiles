vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.wo.number = true

vim.o.backspace = '2'
vim.o.showcmd = true
vim.o.laststatus = 2
vim.o.autowrite = true
vim.o.cursorline = true
vim.o.autoread = true
vim.o.wrap = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.shiftround = true
vim.o.expandtab = true
vim.o.splitright = false
vim.o.splitbelow = false
vim.o.mouse = 'a'

-- Disable making a backup before overwriting a file
vim.o.writebackup = false

-- Copy yanked text to system clipboard
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.cmd([[ set noswapfile ]])
