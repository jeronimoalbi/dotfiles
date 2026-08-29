vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.o
o.number = true
o.relativenumber = true
o.cursorline = true
o.wrap = false
o.mouse = "a"
o.clipboard = "unnamedplus"
o.breakindent = true
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.splitright = true
o.splitbelow = true
o.autowrite = true
o.autoread = true
o.foldenable = false
o.swapfile = false
o.writebackup = false
o.termguicolors = true
o.completeopt = "menuone,noselect"

-- Rust: rustfmt defaults
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 4
o.colorcolumn = "100"
