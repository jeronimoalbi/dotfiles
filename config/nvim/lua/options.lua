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

o.backspace = "2"
o.showcmd = true
o.shiftround = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2

-- Rust: rustfmt line width (the runtime ftplugin already sets shiftwidth=4)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function() vim.opt_local.colorcolumn = "100" end,
})

-- Yanked text goes to the system clipboard (clipboard=unnamedplus) which needs a provider
if vim.fn.has("linux") == 1 then
  local has_clip = vim.fn.executable("xclip") == 1
    or vim.fn.executable("xsel") == 1
    or vim.fn.executable("wl-copy") == 1
  if not has_clip then
    vim.notify("No clipboard provider found. Install xclip, xsel, or wl-clipboard.", vim.log.levels.WARN)
  end
end
