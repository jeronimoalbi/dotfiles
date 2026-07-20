require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "gopls",
    "ts_ls",
  },
  -- rustaceanvim owns the rust-analyzer LSP client lifecycle; without this
  -- exclusion mason-lspconfig's automatic_enable also starts a second,
  -- competing rust_analyzer client, causing duplicate completion items.
  automatic_enable = {
    exclude = { "rust_analyzer" },
  },
  handlers = {
    -- Prevent golangci_lint_ls from auto-starting; nvim-lint handles golangci-lint
    golangci_lint_ls = function() end,
  },
})
