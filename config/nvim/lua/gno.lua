--
-- Enable Gno syntax and formatting
--

vim.api.nvim_create_augroup("gno", { clear = true })

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "gno",
  pattern = "*.gno",
  callback = function ()
    vim.opt_local.filetype = "gno"
    -- NOTE: Right now LSP is started using lspconfig otherwise it could be started here
    -- vim.lsp.start({
    --   name = "gnopls",
    --   cmd = { "gnopls", "serve", "--gnoroot", vim.fn.expand('$HOME/Projects/gnolang/gno') },
    --   root_dir = vim.fn.expand('%:p:h'),
    -- })
  end
})

-- Indent like Go (nvim's go ftplugin does this for Go; there is none for Gno)
vim.api.nvim_create_autocmd("FileType", {
  group = "gno",
  pattern = "gno",
  callback = function()
    vim.bo.expandtab = false
    vim.bo.softtabstop = 0
    vim.bo.shiftwidth = 0
  end,
})

vim.api.nvim_create_augroup("gnotmpl", { clear = true })

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  group = "gnotmpl",
  pattern = "*.gnt",
  callback = function ()
    vim.cmd("set syntax=gnotmpl")
  end
})
