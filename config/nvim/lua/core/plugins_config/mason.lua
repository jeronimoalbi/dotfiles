require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "gopls",
    "ts_ls",
  },
  handlers = {
    -- Prevent golangci_lint_ls from auto-starting; nvim-lint handles golangci-lint
    golangci_lint_ls = function() end,
  },
})
