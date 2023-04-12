-- Enable the use of space in tab
vim.o.expandtab = true
vim.o.tabstop = 2
-- Copy yanked text to system clipboard
vim.o.clipboard = "unnamedplus"
-- Disable wrapping of lines longer than the width of window
vim.o.wrap = false
-- Highlight the text line of the cursor
vim.o.cursorline = true
-- Splitting options
vim.o.splitright = true
vim.o.splitbelow = true
-- Disable making a backup before overwriting a file
vim.o.writebackup = false
-- Enable 24-bit colour
vim.o.termguicolors = true
-- Highlight search
vim.o.hlsearch = true
-- Change indent-blankline.nvim to avoid 1st level indent guide
vim.g.indent_blankline_show_first_indent_level = false

-- Make sure  packer recompiles when the config is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Enable Gno syntax and formatting
vim.api.nvim_create_augroup("gno", { clear = true })
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "gno",
  pattern = "*.gno",
  command = "set filetype=go",
})
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = "gno",
--   pattern = "*.gno",
--   callback = function()
--     vim.lsp.buf.formatting_seq_sync(nil, 7000)
--   end,
-- })

-- Enable typescript formatting
-- vim.api.nvim_create_augroup("tsx", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   group = "tsx",
--   pattern = {"*.ts", "*.tsx"},
--   callback = function()
--     vim.lsp.buf.format({ async = false, timeout_ms = 7000 })
--   end,
-- })

-- Neotree commands
vim.keymap.set("n", "<leader>f", "<cmd>Neotree reveal<cr>", {
  desc = "Toggle Explorer",
  noremap = true,
  silent = true,
})
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", {
  desc = "Focus Explorer",
  noremap = true,
  silent = true,
})

-- Custom LSP settings
require("lspconfig").yamlls.setup({
  settings = {
    yaml = {
      schemas = {
        kubernetes = "k8*/**/*.yaml"
      },
    },
  },
})
-- require("lspconfig").tsserver.setup({
--   on_attach = function(client)
--     client.server_capabilities["documentFormattingProvider"] = false
--     client.server_capabilities["documentRangeFormattingProvider"] = false
--   end,
-- })
-- require('lspconfig').gopls.setup({
--   on_attach = function(client)
--     -- client.server_capabilities["documentFormattingProvider"] = false
--     client.server_capabilities["documentRangeFormattingProvider"] = false
--   end,
-- })
